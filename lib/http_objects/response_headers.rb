module HttpObjects::ResponseHeaders

  extend HttpObjects::Tools

  # 14.5 Accept-Ranges
  # Pending: implement spec
  AcceptRanges = Header("Accept-Ranges", HttpObjects::Parameters::BasicRules::Token)

  # 14.6 Age
  Age = Header("Age", HttpObjects::Parameters::BasicRules::Digit)

  # 14.19 ETag
  #    ETag: "xyzzy"
  #    ETag: W/"xyzzy"
  #    ETag: ""
  # Pending: implement spec
  ETag = Header("ETag", HttpObjects::Parameters::BasicRules::Token)

  # 14.30 Location
  #    Location: http://www.w3.org/pub/WWW/People.html
  Location = Header("Location", HttpObjects::Parameters::Uri)

  # 14.36 Proxy-Authenticate
  # Pending: implement spec
  ProxyAuthenticate = Header("Proxy-Authenticate", HttpObjects::Parameters::BasicRules::Token)

  # 14.37 Retry-After
  #    Retry-After: Fri, 31 Dec 1999 23:59:59 GMT
  #    Retry-After: 120
  # Pending: implement spec
  RetryAfter = Header("Retry-After", HttpObjects::Parameters::BasicRules::Token)

  # 14.38 Server
  #    Server: CERN/3.0 libwww/2.17
  # Pending: implement spec
  Server = Header("Server", HttpObjects::Parameters::BasicRules::Token)

  # 14.44 Vary
  # Pending: implement spec
  Vary = Header("Vary", HttpObjects::Parameters::BasicRules::Token)

  # 14.47 WWW-Authenticate
  # Pending: implement spec
  WWWAuthenticate = Header("WWW-Authenticate", HttpObjects::Parameters::BasicRules::Token)

end
