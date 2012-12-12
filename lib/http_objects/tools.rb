module HttpObjects

  # **Extend** this and be happy declaring HTTP Headers
  module Tools

    def Header(name, klass)
      header_class = Class.new(klass)
      header_class.instance_eval %{
        def header_name
          "#{name}"
        end
      }
      header_class
    end

    def headers
      self.constants.map { |header| self.const_get(header) }
    end

  end

end
