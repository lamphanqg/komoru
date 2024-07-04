module Komoru
  class Customer < Object; end

  def self.resource_names_to_classes
    {
      "customer" => Customer
    }
  end
end
