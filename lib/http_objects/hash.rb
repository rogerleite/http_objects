module HttpObjects

  class Hash < ::Hash
    extend HttpObjects::Headers::Attributes

    # Public: Block that creates method based on attribute name.
    MethodCreator = Proc.new do |header|
      header_name = header.header_name
      attr_name = header_name.downcase.gsub("-", "_")
      self.class_eval(%{
        def #{attr_name}                          # def content_type
          self.fetch("#{header_name}", nil)       #   self.fetch("Content-Type", nil)
        end                                       # end
        def #{attr_name}!                         # def content_type!
          self.#{attr_name}.raw if #{attr_name}?  #   self.content_type.raw if content_type?
        end                                       # end
        def #{attr_name}?                         # def content_type?
          !!self.fetch("#{header_name}", nil)     #   !!self.fetch("Content-Type", nil)
        end                                       # end
      })
    end

    # Public: Register attribute class with *MethodCreator* block.
    def self.add_attribute(attr_class)
      support_header(attr_class, &MethodCreator)
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
