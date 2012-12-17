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
      yield(header_class) if block_given?
      header_class
    end

  end

end
