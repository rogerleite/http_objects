
module HttpObjects

  # Public: Hash with HTTP Headers methods.
  #
  # Examples
  #
  #    headers = HttpObjects::Headers.new
  #    # it's a normal hash (for normal keys)
  #    headers["key"] = "value"
  #
  #    # for HTTP headers, you have objects
  #    headers["Content-Type"] = "text/html;Charset=utf-8"
  #    # one can check if header exist
  #    headers.content_type? # => true
  #    # one can access raw value
  #    headers.content_type! # => "text/html;Charset=utf-8"
  #    # one can access the value
  #    headers.content_type.value # => "text/html"
  #    # one can read directives
  #    headers.content_type['charset'] # => "utf-8"
  #    # finally one can access the object
  #    headers.content_type.inspect # => #<HttpObjects::Headers::MediaType ...>
  #
  class Hash < ::Hash
    extend HttpObjects::Headers::Attributes

    support_all_headers do |header|
      header_name = header.header_name
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

    # Public: Associates key with value. If key is a valid HTTP Header name,
    # like "Content-Type", it parses as HTTP Object.
    #
    # key - key or HTTP Header name.
    # value - object. If key is HTTP Header name, value should be a String.
    def []=(key, value)
      if (header_class = self.class.headers[key])
        value = header_class.parse(value)
      end
      super(key, value)
    end
    alias :store :[]=

  end

end
