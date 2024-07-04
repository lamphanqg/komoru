RSpec.describe Komoru::ListObject do
  subject(:object) do
    described_class.new(attrs)
  end

  let(:attrs) do
    {
      "resource" => "list",
      "total" => 1,
      "page" => 1,
      "per_page" => 10,
      "last_page" => 1,
      "data" => [
        {
          "id" => "54oy1car81mgztytc59ha8bgb",
          "resource" => "customer",
          "email" => "test@example.com",
          "source" => {
            "type" => "credit_card",
            "brand" => "visa",
            "last_four_digits" => "1111",
            "month" => 5,
            "year" => 2028
          },
          "metadata" => {},
          "created_at" => "2024-06-22T07:17:50Z"
        }
      ]
    }
  end

  describe "#initialize" do
    it "translates attributes to instance methods" do
      expect(object.resource).to eq("list")
      expect(object.total).to eq(1)
      expect(object.page).to eq(1)
      expect(object.per_page).to eq(10)
      expect(object.last_page).to eq(1)
    end

    it "initializes each item in the data array with the appropriate object class" do
      expect(object.data).to all(be_a(Komoru::Customer))
      expect(object.data.first.id).to eq("54oy1car81mgztytc59ha8bgb")
    end
  end
end
