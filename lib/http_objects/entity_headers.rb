module HttpObjects::EntityHeaders

  # 14.23 Content-Type
  # The Content-Type entity-header field indicates the media type of the entity-body sent to the recipient or, in the case of the HEAD method, the media type that would have been sent had the request been a GET.
  #     Content-Type = "Content-Type" ":" media-type
  # Media types are defined in Media Types. An example of the field is
  #     Content-Type: text/html; charset=ISO-8859-4
  ContentType = Class.new(HttpObjects::Parameters::MediaType)

end
