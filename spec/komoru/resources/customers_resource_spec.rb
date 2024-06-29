RSpec.describe Komoru::CustomersResource do
  describe "#retrieve" do
    it "retrieves a customer" do
      stubbed_request = stub_request(
        :get,
        "https://komoju.com/api/v1/customers/54oy1car81mgztytc59ha8bgb"
      ).to_return(
        status: 200,
        headers: {"Content-Type": "application/json"},
        body: {
          id: "54oy1car81mgztytc59ha8bgb",
          resource: "customer",
          email: "test@example.com",
          source: {
            type: "credit_card",
            brand: "visa",
            last_four_digits: "1111",
            month: 5,
            year: 2028
          },
          metadata: {},
          created_at: "2024-06-22T07:17:50Z"
        }.to_json
      )
      client = Komoru::Client.new(secret_key: "secret_key")
      customers_resource = Komoru::CustomersResource.new(client)
      customer = customers_resource.retrieve("54oy1car81mgztytc59ha8bgb")
      expect(stubbed_request).to have_been_requested
      expect(customer).to be_a(Komoru::Customer)
      expect(customer.id).to eq("54oy1car81mgztytc59ha8bgb")
    end
  end
end
