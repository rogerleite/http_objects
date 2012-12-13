require "uri"

module HttpObjects::Parameters

  # 3.2 Uniform Resource Identifiers
  # Examples
  #    http://abc.com:80/~smith/home.html
  #    /~smith/home.html
  class Uri < HttpObjects::Parameters::BasicRules::Base

    def self.parse(value)
      raw = value
      if !(value.nil? || value == "")
        value = URI.parse(value.to_s)
      end
      self.new(raw, value)
    end

  end

end
