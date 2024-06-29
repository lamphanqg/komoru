module Komoru
  class Object
    include Enumerable

    def initialize(attributes = {})
      @attributes = attributes

      attributes.each do |key, value|
        value = Object.new(value) if value.is_a?(Hash)
        instance_variable_set(:"@#{key}", value)
        self.class.send(:attr_reader, key)
      end
    end

    private

    attr_reader :attributes

    def each(&block) = attributes.each(&block)
  end
end
