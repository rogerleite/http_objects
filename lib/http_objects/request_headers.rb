module HttpObjects::RequestHeaders

  extend HttpObjects::Tools

  # 14.1 Accept
  #    Accept: audio/*; q=0.2, audio/basic
  # Pending: implement spec
  Accept = Header("Accept", HttpObjects::Parameters::BasicRules::Token)

  # 14.2 Accept-Charset
  #   Accept-Charset: iso-8859-5, unicode-1-1;q=0.8
  # Pending: implement spec
  AcceptCharset = Header("Accept-Charset", HttpObjects::Parameters::BasicRules::Token)

  # 14.3 Accept-Encoding
  #   Accept-Encoding: compress, gzip
  #   Accept-Encoding:
  #   Accept-Encoding: *
  #   Accept-Encoding: compress;q=0.5, gzip;q=1.0
  #   Accept-Encoding: gzip;q=1.0, identity; q=0.5, *;q=0
  # Pending: implement spec
  AcceptEncoding = Header("Accept-Encoding", HttpObjects::Parameters::BasicRules::Token)

  # 14.4 Accept-Language
  #   Accept-Language: da, en-gb;q=0.8, en;q=0.7
  # Pending: implement spec
  AcceptLanguage = Header("Accept-Language", HttpObjects::Parameters::BasicRules::Token)

  # 14.8 Authorization
  # Pending: implement spec
  Authorization = Header("Authorization", HttpObjects::Parameters::BasicRules::Token)

  # 14.20 Expect
  # Pending: implement spec
  Expect = Header("Expect", HttpObjects::Parameters::BasicRules::Token)

  # 14.22 From
  #    From: webmaster@w3.org
  # Pending: implement spec
  From = Header("From", HttpObjects::Parameters::BasicRules::Token)

  # 14.23 Host
  #    Host: www.w3.org
  Host = Header("Host", HttpObjects::Parameters::Uri)

  # 14.24 If-Match
  #    If-Match: "xyzzy"
  #    If-Match: "xyzzy", "r2d2xxxx", "c3piozzzz"
  #    If-Match: *
  # Pending: implement spec
  IfMatch = Header("If-Match", HttpObjects::Parameters::BasicRules::Token)

  # 14.25 If-Modified-Since
  #    If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT
  IfModifiedSince = Header("If-Modified-Since", HttpObjects::Parameters::DateTime)

  # 14.26 If-None-Match
  #    If-None-Match: "xyzzy"
  #    If-None-Match: W/"xyzzy"
  #    If-None-Match: "xyzzy", "r2d2xxxx", "c3piozzzz"
  #    If-None-Match: W/"xyzzy", W/"r2d2xxxx", W/"c3piozzzz"
  #    If-None-Match: *
  # Pending: implement spec
  IfNoneMatch = Header("If-None-Match", HttpObjects::Parameters::BasicRules::Token)

  # 14.27 If-Range
  # Pending: implement spec
  IfRange = Header("If-Range", HttpObjects::Parameters::BasicRules::Token)

  # 14.28 If-Unmodified-Since
  #    If-Unmodified-Since: Sat, 29 Oct 1994 19:43:31 GMT
  IfUnmodifiedSince = Header("If-Unmodified-Since", HttpObjects::Parameters::DateTime)

end
