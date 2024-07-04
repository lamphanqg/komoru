module Komoru
  class ListObject
    include Enumerable

    def initialize(attributes = {data: []})
      @attributes = attributes

      attributes.each do |key, value|
        if key == "data"
          value = value.map do |obj|
            klass = Komoru.resource_names_to_classes[obj["resource"]]
            klass.new(obj)
          end
        end
        instance_variable_set(:"@#{key}", value)
        self.class.send(:attr_reader, key)
      end
    end

    def each(&block) = data.each(&block)
  end
end
