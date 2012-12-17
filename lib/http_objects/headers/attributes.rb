module HttpObjects::Headers

  # Public: Extend this module and you be able to retrieve and register
  # attributes in your class.
  #
  # Examples
  #
  #    class SampleAttributes
  #      extend HttpObjects::Headers::Attributes
  #      register_attribute "MyAttributeName", MyObject do |object|
  #        # optional hook
  #      end
  #    end
  #
  #    SampleAttributes.attributes # => {"MyAttributeName" => MyObject}
  module Attributes

    # Returns Hash of registered attributes.
    def attributes
      @attributes ||= {}
    end

    # Public: Register on *attributes*, the pair name and attr_class.
    #
    # name - String identifying attribute.
    # attr_class - Class to identify the attribute.
    #
    # Yields name and attr_class informed. Optional.
    #
    # Returns nothing.
    def register_attribute(name, attr_class)
      attributes[name] = attr_class
      yield(name, attr_class) if block_given?
    end

  end

end
