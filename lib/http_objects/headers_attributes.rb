module HttpObjects

  module HeadersAttributes

    def headers
      @headers ||= {}
    end

    def support_header(header_class)
      header_name = header_class.header_name
      headers[header_name] = header_class

      attr_name = header_name.downcase.gsub("-", "_")
      self.class_eval(%{
        def #{attr_name}                                 # def content_type
          self.fetch("#{header_name}", nil)              #   self.fetch("Content-Type", nil)
        end                                              # end
        def #{attr_name}!                                # def content_type!
          self.#{attr_name}.raw if #{attr_name}?         #   self.content_type.raw if content_type?
        end                                              # end
        def #{attr_name}?                                # def content_type?
          !!self.fetch("#{header_name}", nil)            #   !!self.fetch("Content-Type", nil)
        end                                              # end
      })
    end

  end

end
