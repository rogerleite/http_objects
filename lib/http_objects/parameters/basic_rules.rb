module HttpObjects::Parameters

  # 2.2 Basic Rules
  # This module implement some basic parsing constructs, from RFC 2616.
  module BasicRules

    # Public: Base interface for HTTP Header.
    # HTTP Header should have:
    #
    #    # parse method that returns self instance.
    #    Base.parse("value") # => <# Base instance >
    #
    #    # constructor with raw and value.
    #    header = Base.new("raw", "value")
    class Base
      attr_reader :raw, :value

      def self.parse(value)
        raise "Not implemented. You should override this method and return an instance of yourself. See HttpObjects::Parameters::BasicRules source for examples."
      end

      def initialize(raw, value)
        @raw, @value = raw, value
      end
    end

    # Public: Mapped to String.
    #    token = 1*<any CHAR except CTLs or separators>
    class Token < Base
      def self.parse(value)
        self.new(value, value)
      end
    end

    # Public: Mapped to Integer.
    #    DIGIT = <any US-ASCII digit "0".."9">
    class Digit < Base
      def self.parse(value)
        self.new(value, value.to_i)
      end
    end

    # Public: Mapped to String#upcase.
    #    UPALPHA = <any US-ASCII uppercase letter "A".."Z">
    class UpAlpha < Base
      def self.parse(value)
        self.new(value, value.to_s.upcase)
      end
    end

    # Public: Mapped to String#downcase.
    #    LOALPHA = <any US-ASCII lowercase letter "a".."z">
    class LoAlpha < Base
      def self.parse(value)
        self.new(value, value.to_s.downcase)
      end
    end

  end

end

