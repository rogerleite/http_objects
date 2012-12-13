module HttpObjects::Parameters

  # 3.10 Language Tags
  # Examples
  #    en, en-US, en-cockney, i-cherokee, x-pig-latin
  class LanguageTags < HttpObjects::Parameters::BasicRules::Base

    def self.parse(value)
      raw = value
      value = value.to_s.gsub(/(\s+)/, "").split(",")
      self.new(raw, value)
    end

  end

end
