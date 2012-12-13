module HttpObjects::ResponseHeaders

  extend HttpObjects::Tools

  # 14.5 Accept-Ranges
  # Pending: implement spec
  AcceptRanges = Header("Accept-Ranges", HttpObjects::Parameters::BasicRules::Token)

end
