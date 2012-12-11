require "uri"

module HttpObjects::Parameters

  # 3.2 Uniform Resource Identifiers
  # URIs have been known by many names: WWW addresses, Universal Document Identifiers, Universal Resource Identifiers RFC 1630, and finally the combination of Uniform Resource Locators (URL) RFC 1738 and Names (URN) RFC 1737. As far as HTTP is concerned, Uniform Resource Identifiers are simply formatted strings which identify--via name, location, or any other characteristic--a resource.
  class Uri
    attr_reader :raw, :value

    def self.parse(value)
      raw = value
      if !(value.nil? || value == "")
        value = URI.parse(value.to_s)
      end
      self.new(raw, value)
    end

    def initialize(raw, value)
      @raw, @value = raw, value
    end
  end

end
