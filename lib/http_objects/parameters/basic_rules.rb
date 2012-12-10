module HttpObjects::Parameters

  module BasicRules

    # DIGIT = <any US-ASCII digit "0".."9">
    class Digit
      attr_reader :raw, :value

      def self.parse(value)
        self.new(value, value.to_i)
      end

      def initialize(raw, value)
        @raw, @value = raw, value
      end
    end

  end

end

