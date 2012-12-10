module HttpObjects::Headers

  # 14.23 Content-Type
  # The Content-Type entity-header field indicates the media type of the entity-body sent to the recipient or, in the case of the HEAD method, the media type that would have been sent had the request been a GET.
  #
  # Content-Type   = "Content-Type" ":" media-type
  # Media types are defined in Media Types. An example of the field is
  #
  # Content-Type: text/html; charset=ISO-8859-4
  class ContentType

    def self.parse(value)
      self.new(HttpObjects::Parameters::MediaType.parse(value))
    end

    def initialize(media_type)
      @media_type = media_type
    end

    def raw
      @media_type.raw
    end

    def value
      @media_type.value
    end

    def parameters
      @media_type.parameters
    end
  end

end
