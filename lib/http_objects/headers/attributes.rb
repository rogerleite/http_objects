module HttpObjects::Headers

  # Provides methods to register and retrieve HttpObjects::Headers::Tools.Header class.
  module Attributes

    # Returns Hash of registered Header classes.
    def headers
      @headers ||= {}
    end

    # Register *header_class* using *header_class.header_name*.
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
