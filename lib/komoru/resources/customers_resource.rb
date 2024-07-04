# frozen_string_literal: true

require "faraday"

module Komoru
  class CustomersResource
    def initialize(client)
      @client = client
    end

    def list
      response = @client.connection.get("customers")
      ListObject.new(response.body)
    end

    def retrieve(id)
      response = @client.connection.get("customers/#{id}")
      Customer.new(response.body)
    end
  end
end
