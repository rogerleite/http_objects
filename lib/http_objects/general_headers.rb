module HttpObjects::GeneralHeaders

  extend HttpObjects::Tools

  # 14.18 Date
  Date = Header("Date", HttpObjects::Parameters::DateTime)

end
