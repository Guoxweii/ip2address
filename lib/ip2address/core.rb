module Ip2address
  class Core
    IP_SEARCH_URL = "http://ip.taobao.com/service/getIpInfo.php"

    attr_accessor :ip
    attr_accessor :country
    attr_accessor :area
    attr_accessor :region
    attr_accessor :city
    attr_accessor :isp

    def initialize(ip)
      @ip = ip

      fetch_info_by_ip
    end

  private

    def fetch_info_by_ip
      conn = Faraday.new do |conn|
        conn.request  :url_encoded
        conn.response :raise_error
        conn.response :json
        conn.adapter  Faraday.default_adapter
      end

      response = conn.get IP_SEARCH_URL, { ip: @ip }
      return if response.body["code"] == 1
      ["country", "area", "region", "city", "isp"].each do |variable|
        self.send "#{variable}=", response.body["data"][variable]
      end
    end
  end
end