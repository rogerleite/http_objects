module HttpObjects

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

  end

end
