module HttpObjects::Parameters

  # 3.7. Media Types
  #
  # media-type = type "/" subtype *( ";" parameter )
  # type       = token
  # subtype    = token
  #
  # Examples
  #   text/html; charset=ISO-8859-4
  class MediaType

    attr_reader :raw, :value, :parameters

    def self.parse(value)
      raw = value
      value, params = value.to_s.split(";", 2)
      value = value.to_s
      params = params.to_s

      parameters = {}
      params.split(/\s*;\s*/).each do |param|
        name, param_value = param.split(/=/)
        name = name.gsub(/\s*/, "")
        parameters[name.downcase] = param_value
      end
      self.new(raw, value, parameters)
    end

    def initialize(raw, value, parameters)
      @raw = raw
      @value = value
      @parameters = parameters
    end

    def charset?
      !!self.charset!
    end

    def charset!
      @parameters.fetch("charset", nil)
    end

  end

end
