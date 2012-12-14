module HttpObjects

  # **Extend** this and be happy declaring HTTP Headers
  module Tools

    def Header(name, klass = nil, &block)
      header_class = if block_given?
                       Class.new(&block)
                     else
                       Class.new(klass)
                     end
      header_class.instance_eval %{
        def header_name
          "#{name}"
        end
      }
      header_class
    end

    # Returns Array of Header classes.
    def headers
      self.constants.map { |header| self.const_get(header) }
    end

  end

end
