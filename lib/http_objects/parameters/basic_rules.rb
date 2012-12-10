module HttpObjects::Parameters

  module BasicRules

    class Base
      attr_reader :raw, :value

      def self.parse(value)
        raise "must implement"
      end

      def initialize(raw, value)
        @raw, @value = raw, value
      end
    end

    # DIGIT = <any US-ASCII digit "0".."9">
    class Digit < Base
      def self.parse(value)
        self.new(value, value.to_i)
      end
    end

    # UPALPHA = <any US-ASCII uppercase letter "A".."Z">
    class UpAlpha < Base
      def self.parse(value)
        self.new(value, value.to_s.upcase)
      end
    end

  end

end

