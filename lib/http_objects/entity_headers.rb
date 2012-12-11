module HttpObjects::EntityHeaders

  # 14.7 Allow
  # The Allow entity-header field lists the set of methods supported by the resource identified by the Request-URI. The purpose of this field is strictly to inform the recipient of valid methods associated with the resource. An Allow header field MUST be present in a 405 (Method Not Allowed) response.
  #     Allow   = "Allow" ":" #Method
  # Example of use:
  #     Allow: GET, HEAD, PUT
  Allow = Class.new(HttpObjects::Parameters::BasicRules::UpAlpha)

  # 14.12 Content-Language
  # The Content-Language entity-header field describes the natural language(s) of the intended audience for the enclosed entity. Note that this might not be equivalent to all the languages used within the entity-body.
  # Content-Language  = "Content-Language" ":" 1#language-tag
  # Language tags are defined in Language Tags. The primary purpose of Content-Language is to allow a user to identify and differentiate entities according to the user's own preferred language. Thus, if the body content is intended only for a Danish-literate audience, the appropriate field is
  #     Content-Language: da
  # If no Content-Language is specified, the default is that the content is intended for all language audiences. This might mean that the sender does not consider it to be specific to any natural language, or that the sender does not know for which language it is intended.
  # Multiple languages MAY be listed for content that is intended for multiple audiences. For example, a rendition of the "Treaty of Waitangi," presented simultaneously in the original Maori and English versions, would call for
  #     Content-Language: mi, en
  # However, just because multiple languages are present within an entity does not mean that it is intended for multiple linguistic audiences. An example would be a beginner's language primer, such as "A First Lesson in Latin," which is clearly intended to be used by an English-literate audience. In this case, the Content-Language would properly only include "en".
  # Content-Language MAY be applied to any media type -- it is not limited to textual documents.
  ContentLanguage = Class.new(HttpObjects::Parameters::LanguageTags)

  # 14.13 Content-Length
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
