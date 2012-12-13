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

end
