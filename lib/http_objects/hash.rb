
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
    extend HttpObjects::HeadersAttributes

    HttpObjects::GeneralHeaders.headers.each do |header|
      support_header(header)
    end
    HttpObjects::Headers::Entity.headers.each do |header|
      support_header(header)
    end
    HttpObjects::RequestHeaders.headers.each do |header|
      support_header(header)
    end
    HttpObjects::ResponseHeaders.headers.each do |header|
      support_header(header)
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
