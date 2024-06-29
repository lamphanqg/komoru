# frozen_string_literal: true

require "faraday"

module Komoru
  class Client
    BASE_URL = "https://komoju.com/api/v1"

    attr_reader :secret_key, :adapter

    def initialize(secret_key:, adapter: Faraday.default_adapter)
      @secret_key = secret_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |conn|
        conn.request :authorization, :basic, secret_key, ""
        conn.request :json
        conn.response :json
        conn.adapter adapter
      end
    end

    def customers
      Komoru::CustomersResource.new(self)
    end
  end
end
