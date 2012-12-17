require "test_helper"

describe HttpObjects::Hash do

  MyObject = Class.new do
    attr_reader :value, :raw
    def self.header_name
      "MyObject"
    end
    def self.parse(value)
      self.new(value)
    end
    def initialize(value)
      @raw, @value = value
    end
  end

  class TestHash < HttpObjects::Hash
    add_attribute(MyObject)
  end

  subject { TestHash.new }

  describe "#[]=" do
    it "simple value" do
      subject["chave"] = "valor"
      subject["chave"].must_equal("valor")
    end
    it "HTTP Header value" do
      subject["MyObject"] = "value"
      subject["MyObject"].must_be_instance_of(MyObject)
    end
    it "without value" do
      subject["MyObject"].must_be_nil
    end
  end

  describe "#store as alias of []=" do
    it "simple value" do
      subject.store("chave", "valor")
      subject["chave"].must_equal("valor")
    end
    it "HTTP Header value" do
      subject.store("MyObject", "value")
      subject["MyObject"].must_be_instance_of(MyObject)
    end
  end

  it "header as instance method" do
    subject.store("MyObject", "value")
    subject["MyObject"].must_be_instance_of(MyObject)

    subject.myobject.must_be_instance_of(MyObject)
    subject.myobject?.must_equal(true)
    subject.myobject!.must_equal("value")
  end

end

describe HttpObjects::HeadersHash do

  subject { HttpObjects::HeadersHash.new }

  it "kind of HttpObjects::Hash" do
    subject.must_be_kind_of(HttpObjects::Hash)
  end

  it "include all HTTP Headers" do
    subject = HttpObjects::HeadersHash.headers.values
    HttpObjects::Headers.headers.each do |h|
      subject.must_include(h)
    end
  end

end
