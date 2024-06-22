# frozen_string_literal: true

RSpec.describe Komoru::Client do
  describe "#connection" do
    subject(:connection) { described_class.new(secret_key: "secret_key").connection }

    it "returns a Faraday connection" do
      expect(connection).to be_a(Faraday::Connection)
    end

    it "uses the default Faraday adapter by default" do
      expect(connection.adapter).to eq(Faraday::Adapter::NetHttp)
    end

    it "encodes & decodes JSON" do
      stubbed_req = stub_request(:post, "https://komoju.com/api/v1/endpoint")
        .with(body: {req_param: "value"}.to_json)
        .to_return(
          headers: {"Content-Type" => "application/json"},
          body: {res_param: "value"}.to_json
        )
      res = connection.post("endpoint", req_param: "value")
      expect(res.body).to eq("res_param" => "value")
      expect(stubbed_req).to have_been_requested
    end
  end
end
