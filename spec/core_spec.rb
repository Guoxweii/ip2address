require "spec_helper"

describe Ip2address::Core do
  let(:failed_json) { {"code" => 0, "data" => {} } }
  let(:success_json) {
    {
      "code" => 0,
      "data"=> {
        "country" => "Ameraic",
           "area" => "ABalama",
           "city" => "LosAngel",
            "isp" => ""
      }
    }
  }

  describe ".get_info_by_ip" do
    let(:api_request) { stub_request(:get, Regexp.new(Ip2address::Core::IP_SEARCH_URL)) }

    context "will visit API URL" do
      before(:each) { api_request.to_return(body: success_json.to_json) }

      action { Ip2address::Core.new("127.0.0.1") }

      it { expect(api_request).to have_been_requested }
    end
  end

  describe "initialize with create instance_variable ip" do
    let(:ip) { "127.0.0.1" }
    let(:api_request) { stub_request(:get, Regexp.new(Ip2address::Core::IP_SEARCH_URL)) }
    let(:ip2address) { Ip2address::Core.new(ip) }

    context "with success response" do
      before(:each) { api_request.to_return(body: success_json.to_json) }

      it { expect(ip2address.ip).to eq ip
           expect(ip2address.country).to eq success_json["data"]["country"]
           expect(ip2address.city).to eq success_json["data"]["city"] }
    end

    context "with failed response" do
      before(:each) { api_request.to_return(body: failed_json.to_json) }

      it { expect(ip2address.ip).to eq ip
           expect(ip2address.country).to eq nil
           expect(ip2address.city).to eq nil }
    end
  end
end