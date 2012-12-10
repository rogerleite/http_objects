module HttpObjects::Parameters

  # 3.7. Media Types (Protocol Parameters)
  # HTTP uses Internet Media Types RFC 1590 in the Content-Type (Content-Type) and Accept (Accept) header fields in order to provide open and extensible data typing and type negotiation.
  #
  # media-type     = type "/" subtype *( ";" parameter )
  # type           = token
  # subtype        = token
  # Parameters MAY follow the type/subtype in the form of attribute/value pairs (as defined in Transfer Codings).
  #
  # The type, subtype, and parameter attribute names are case-insensitive. Parameter values might or might not be case-sensitive, depending on the semantics of the parameter name. Linear white space (LWS) MUST NOT be used between the type and subtype, nor between an attribute and its value. The presence or absence of a parameter might be significant to the processing of a media-type, depending on its definition within the media type registry.
  #
  # Note that some older HTTP applications do not recognize media type parameters. When sending data to older HTTP applications, implementations SHOULD only use media type parameters when they are required by that type/subtype definition.
  #
  # Media-type values are registered with the Internet Assigned Number Authority (IANA RFC 1700). The media type registration process is outlined in RFC 1590 RFC 1590. Use of non-registered media types is discouraged.
  # Example:
  #   text/html; charset=ISO-8859-4
  class MediaType

    attr_reader :raw, :value, :parameters

    def self.parse(value)
      raw = value
      value, params = value.split(";", 2)

      parameters = {}
      params.split(/\s*;\s*/).each do |param|
        name, param_value = param.split(/=/)
        name = name.gsub(/\s*/, "")
        parameters[name.downcase] = param_value
      end
      self.new(raw, value, parameters)
    end

    def initialize(raw, value, parameters)
      @raw, @value, @parameters = raw, value, parameters
    end

  end

end
