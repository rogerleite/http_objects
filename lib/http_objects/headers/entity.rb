module HttpObjects::Headers::Entity

  extend HttpObjects::Headers::Tools

  # 14.7 Allow
  #     Allow: GET, HEAD, PUT
  Allow = Header("Allow", HttpObjects::Parameters::BasicRules::UpAlpha)

  # 14.11 Content-Encoding
  # Pending: implement spec
  ContentEncoding = Header("Content-Encoding", HttpObjects::Parameters::BasicRules::LoAlpha)

  # 14.12 Content-Language
  #     Content-Language: mi, en
  ContentLanguage = Header("Content-Language", HttpObjects::Parameters::LanguageTags)

  # 14.13 Content-Length
  #     Content-Length: 3495
  ContentLength = Header("Content-Length", HttpObjects::Parameters::BasicRules::Digit)

  # 14.14 Content-Location
  ContentLocation = Header("Content-Location", HttpObjects::Parameters::Uri)

  # 14.15 Content-MD5
  ContentMD5 = Header("Content-MD5", HttpObjects::Parameters::BasicRules::Token)

  # 14.16 Content-Range
  # Pending: implement spec
  ContentRange = Header("Content-Range", HttpObjects::Parameters::BasicRules::Token)

  # 14.21 Expires
  #     Expires: Thu, 01 Dec 1994 16:00:00 GMT
  Expires = Header("Expires", HttpObjects::Parameters::DateTime)

  # 14.23 Content-Type
  #     Content-Type: text/html; charset=ISO-8859-4
  ContentType = Header("Content-Type", HttpObjects::Parameters::MediaType)

  # Last-Modified
  #     Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT
  LastModified = Header("Last-Modified", HttpObjects::Parameters::DateTime)

end
