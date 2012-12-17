module HttpObjects

  # Public: Hash with HTTP Headers methods.
  #
  # Examples
  #
  #    headers = HttpObjects::Headers.new
  #    headers["key"] = "value" # is kind of Hash
  #
  #    # And for HTTP headers, you have objects
  #    headers["Content-Type"] = "text/html;Charset=utf-8"
  #    headers.content_type? # => true
  #    headers.content_type! # => "text/html;Charset=utf-8"
  #    headers.content_type.value # => "text/html"
  #    headers.content_type['charset'] # => "utf-8"
  #    headers.content_type.inspect # => #<HttpObjects::Headers::MediaType ...>
  class HeadersHash < HttpObjects::Hash

    HttpObjects::Headers.headers.each do |header|
      add_attribute(header)
    end

  end

end
