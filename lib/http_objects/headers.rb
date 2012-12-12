require "http_objects/entity_headers"
require "http_objects/headers_attributes"

module HttpObjects

  class Headers < Hash
    extend HttpObjects::HeadersAttributes

    HttpObjects::EntityHeaders.headers.each do |header|
      support_header(header)
    end

    def []=(header_name, value)
      if (header_class = self.class.headers[header_name])
        value = header_class.parse(value)
      end
      super(header_name, value)
    end
    alias :store :[]=

  end

end
