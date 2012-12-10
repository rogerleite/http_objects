module HttpObjects::EntityHeaders

  # Content-Length
  # The Content-Length entity-header field indicates the size of the entity-body, in decimal number of OCTETs, sent to the recipient or, in the case of the HEAD method, the size of the entity-body that would have been sent had the request been a GET.
  #     Content-Length    = "Content-Length" ":" 1*DIGIT
  # An example is
  #     Content-Length: 3495
  ContentLength = Class.new(HttpObjects::Parameters::BasicRules::Digit)

  # 14.21 Expires
  # The Expires entity-header field gives the date/time after which the response is considered stale. A stale cache entry may not normally be returned by a cache (either a proxy cache or a user agent cache) unless it is first validated with the origin server (or with an intermediate cache that has a fresh copy of the entity). See Expiration Model for further discussion of the expiration model.
  # The presence of an Expires field does not imply that the original resource will change or cease to exist at, before, or after that time.
  # The format is an absolute date and time as defined by HTTP-date in Full Date; it MUST be in RFC 1123 date format:
  #     Expires = "Expires" ":" HTTP-date
  # An example of its use is
  #     Expires: Thu, 01 Dec 1994 16:00:00 GMT
  Expires = Class.new(HttpObjects::Parameters::DateTime)

  # 14.23 Content-Type
  # The Content-Type entity-header field indicates the media type of the entity-body sent to the recipient or, in the case of the HEAD method, the media type that would have been sent had the request been a GET.
  #     Content-Type = "Content-Type" ":" media-type
  # Media types are defined in Media Types. An example of the field is
  #     Content-Type: text/html; charset=ISO-8859-4
  ContentType = Class.new(HttpObjects::Parameters::MediaType)

  # Last-Modified
  # The Last-Modified entity-header field indicates the date and time at which the origin server believes the variant was last modified.
  #     Last-Modified  = "Last-Modified" ":" HTTP-date
  # An example of its use is
  #     Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT
  LastModified = Class.new(HttpObjects::Parameters::DateTime)

end
