RSpec.describe Komoru::Object do
  subject(:object) do
    described_class.new(attrs)
  end

  let(:attrs) do
    {
      "id" => "3pm1aq6txwxsoag8i5moizvh3",
      "resource" => "subscription",
      "status" => "active",
      "amount" => 2000,
      "currency" => "JPY",
      "customer" => {
        "id" => 671856,
        "uuid" => "54oy1car81mgztytc59ha8bgb",
        "merchant_id" => 86025,
        "created_at" => "2024-06-22T16:17:50.469+09:00",
        "updated_at" => "2024-06-22T17:10:14.188+09:00",
        "email" => "test@example.com",
        "currency" => "JPY"
      }
    }
  end

  describe "#initialize" do
    it "translates attributes to instance methods" do
      expect(object.id).to eq("3pm1aq6txwxsoag8i5moizvh3")
      expect(object.resource).to eq("subscription")
      expect(object.status).to eq("active")
    end

    it "initializes nested objects" do
      expect(object.customer).to be_a(Komoru::Object)
      expect(object.customer.id).to eq(671856)
      expect(object.customer.uuid).to eq("54oy1car81mgztytc59ha8bgb")
      expect(object.customer.merchant_id).to eq(86025)
    end
  end

  it "can be converted to hash" do
    expect(object.to_h).to eq(attrs)
  end
end
