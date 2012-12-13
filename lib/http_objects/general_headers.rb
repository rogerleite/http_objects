module HttpObjects::GeneralHeaders

  extend HttpObjects::Tools

  # 14.10 Connection
  #     Connection: close
  Connection = Header("Connection", HttpObjects::Parameters::BasicRules::Token)

  # 14.18 Date
  #     Date: Tue, 15 Nov 1994 08:12:31 GMT
  Date = Header("Date", HttpObjects::Parameters::DateTime)

  # 14.40 Trailer
  Trailer = Header("Trailer", HttpObjects::Parameters::BasicRules::Token)

  # 14.42 Upgrade
  #     Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11
  Upgrade = Header("Upgrade", HttpObjects::Parameters::BasicRules::Token)

  # 14.45 Via
  #     Via: 1.0 fred, 1.1 nowhere.com (Apache/1.1)
  #     Via: 1.0 ricky, 1.1 ethel, 1.1 fred, 1.0 lucy
  # Pending: implement spec
  Via = Header("Via", HttpObjects::Parameters::BasicRules::Token)

  # 14.46 Warning
  # Pending: implement spec
  Warning = Header("Warning", HttpObjects::Parameters::BasicRules::Token)

end
