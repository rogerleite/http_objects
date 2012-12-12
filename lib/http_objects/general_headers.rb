module HttpObjects::GeneralHeaders

  extend HttpObjects::Tools

  # 14.10 Connection
  Connection = Header("Connection", HttpObjects::Parameters::BasicRules::Octet)

  # 14.18 Date
  Date = Header("Date", HttpObjects::Parameters::DateTime)

  # 14.40 Trailer
  Trailer = Header("Trailer", HttpObjects::Parameters::BasicRules::Octet)

  # 14.42 Upgrade
  Upgrade = Header("Upgrade", HttpObjects::Parameters::BasicRules::Octet)

  # 14.45 Via
  # Pending: implement spec
  Via = Header("Via", HttpObjects::Parameters::BasicRules::Octet)

  # 14.46 Warning
  # Pending: implement spec
  Warning = Header("Warning", HttpObjects::Parameters::BasicRules::Octet)

end
