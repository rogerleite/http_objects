module HttpObjects

  class Hash < ::Hash
    extend HttpObjects::Headers::Attributes

    # Public: Block that creates method based on attribute name.
    MethodCreator = Proc.new do |name, header|
      attr_name = name.downcase.gsub("-", "_")
      self.class_eval(%{
        def #{attr_name}                          # def content_type
          self.fetch("#{name}", nil)       #   self.fetch("Content-Type", nil)
        end                                       # end
        def #{attr_name}!                         # def content_type!
          self.#{attr_name}.raw if #{attr_name}?  #   self.content_type.raw if content_type?
        end                                       # end
        def #{attr_name}?                         # def content_type?
          !!self.fetch("#{name}", nil)     #   !!self.fetch("Content-Type", nil)
        end                                       # end
      })
    end

    # Public: Register attribute class with *MethodCreator* block.
    def self.add_attribute(attr_class)
      register_attribute(attr_class.header_name, attr_class, &MethodCreator)
    end

    def self.new(hash = nil)
      hash.kind_of?(HttpObjects::Hash) ? hash : super(hash)
    end

    def initialize(hash = nil)
      super()
      hash.each { |(key, value)| self[key] = value } unless hash.nil?
    end

    # Public: Associates key with value. If key is a valid HTTP Header name,
    # like "Content-Type", it parses as HTTP Object.
    #
    # key - key or HTTP Header name.
    # value - object. If key is HTTP Header name, value should be a String.
    def []=(key, value)
      if (header_class = self.class.attributes[key])
        value = header_class.parse(value)
      end
      super(key, value)
    end
    alias :store :[]=

  end

end
