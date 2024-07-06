RSpec.describe Komoru::CustomersResource do
  let(:client) { Komoru::Client.new(secret_key: "secret_key") }
  let(:customers_resource) { Komoru::CustomersResource.new(client) }

  describe "#list" do
    it "return list of customers" do
      stubbed_request = stub_request(
        :get,
        "https://komoju.com/api/v1/customers"
      ).to_return(
        status: 200,
        headers: {"content-type" => "application/json; charset=utf-8"},
        body: load_fixture("customers/list")
      )
      list = customers_resource.list
      expect(stubbed_request).to have_been_requested
      expect(list).to be_a(Komoru::ListObject)
      expect(list.data.first).to be_a(Komoru::Customer)
      expect(list.data.first.id).to eq("54oy1car81mgztytc59ha8bgb")
    end
  end

  describe "#retrieve" do
    it "retrieves a customer" do
      stubbed_request = stub_request(
        :get,
        "https://komoju.com/api/v1/customers/54oy1car81mgztytc59ha8bgb"
      ).to_return(
        status: 200,
        headers: {"content-type" => "application/json; charset=utf-8"},
        body: load_fixture("customers/retrieve")
      )
      customer = customers_resource.retrieve("54oy1car81mgztytc59ha8bgb")
      expect(stubbed_request).to have_been_requested
      expect(customer).to be_a(Komoru::Customer)
      expect(customer.id).to eq("54oy1car81mgztytc59ha8bgb")
    end
  end
end
