module HttpObjects::Parameters

  # 3.10 Language Tags
  # A language tag identifies a natural language spoken, written, or otherwise conveyed by human beings for communication of information to other human beings. Computer languages are explicitly excluded. HTTP uses language tags within the Accept-Language and Content-Language fields.
  # The syntax and registry of HTTP language tags is the same as that defined by RFC 1766 RFC 1766. In summary, a language tag is composed of 1 or more parts: A primary language tag and a possibly empty series of subtags:
  #     language-tag  = primary-tag *( "-" subtag )
  #     primary-tag   = 1*8ALPHA
  #     subtag        = 1*8ALPHA
  # White space is not allowed within the tag and all tags are case-insensitive. The name space of language tags is administered by the IANA. Example tags include:
  #     en, en-US, en-cockney, i-cherokee, x-pig-latin
  # where any two-letter primary-tag is an ISO-639 language abbreviation and any two-letter initial subtag is an ISO-3166 country code. (The last three tags above are not registered tags; all but the last are examples of tags which could be registered in future.)
  class LanguageTags
    attr_reader :raw, :value

    def self.parse(value)
      raw = value
      value = value.to_s.gsub(/(\s+)/, "").split(",")
      self.new(raw, value)
    end

    def initialize(raw, value)
      @raw, @value = raw, value
    end
  end

end
