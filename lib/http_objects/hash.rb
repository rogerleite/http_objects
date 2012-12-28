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
      key = normalize_key(attr_class.header_name)
      register_attribute(key, attr_class, &MethodCreator)
    end

    def self.new(hash = nil)
      hash.kind_of?(HttpObjects::Hash) ? hash : super(hash)
    end

    def initialize(hash = nil)
      super()
      hash.each_pair { |(key, value)| self[key] = value } unless hash.nil?
    end

    # Public: Associates key with value. If key is a valid HTTP Header name,
    # like "Content-Type", it parses as HTTP Object.
    #
    # key - key or HTTP Header name.
    # value - object. If key is HTTP Header name, value should be a String.
    def []=(key, value)
      key = self.class.normalize_key(key)
      if (header_class = self.class.attributes[key])
        value = header_class.parse(value)
      end
      super(key, value)
    end
    alias :store :[]=

    def [](key)
      key = self.class.normalize_key(key)
      value = self.fetch(key, nil)
      value = value.raw if value.respond_to?(:raw)
      value
    end

    def to_s
      self.keys.inject("") do |out, key|
        out << ", " unless out.empty?
        out << "#{key}: #{self[key]}"
      end
    end

    protected

    def self.normalize_key(key)
      key.downcase if key.respond_to?(:downcase)
    end

  end

end
