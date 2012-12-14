module HttpObjects::Parameters

  # 3.11 Entity Tags
  #
  # Examples
  #    "123456789"    -- A strong ETag validator
  #    W/"123456789"  -- A weak ETag validator
  class EntityTags < HttpObjects::Parameters::BasicRules::Base

    def self.parse(value)
      raw = value
      if (match = value.match(/("\w*")/))
        value = match[1]
      else
        value = ""
      end
      self.new(raw, value.to_s)
    end

    # Returns true if raw start with 'W/'
    def weak?
      @raw.start_with?("W/")
    end

  end

end
