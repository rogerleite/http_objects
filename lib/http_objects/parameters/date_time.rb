require "time"

module HttpObjects::Parameters

  # 3.3. Date/Time Formats (Protocol Parameters)
  # Supports the following formats:
  # Sun, 06 Nov 1994 08:49:37 GMT  ; RFC 822, updated by RFC 1123
  # Sunday, 06-Nov-94 08:49:37 GMT ; RFC 850, obsoleted by RFC 1036
  class DateTime
    attr_reader :raw, :value

    def self.parse(value)
      raw = value
      value = Time.parse(value, true) rescue nil
      self.new(raw, value)
    end

    def initialize(raw, value)
      @raw, @value = raw, value
    end
  end

end
