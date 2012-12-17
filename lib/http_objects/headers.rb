require "http_objects/headers/tools"
require "http_objects/headers/attributes"
require "http_objects/hash"

require "http_objects/headers/directives/cache"

require "http_objects/headers/entity"
require "http_objects/headers/general"
require "http_objects/headers/request"
require "http_objects/headers/response"

module HttpObjects

  module Headers

    # Returns Array of all HTTP Headers
    def self.headers
      [HttpObjects::Headers::General,
       HttpObjects::Headers::Entity,
       HttpObjects::Headers::Request,
       HttpObjects::Headers::Response].inject([]) do |headers, header_module|
         headers.concat(header_module.headers)
       end
    end

  end
end
