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

  describe "#initialize" do
    subject { TestHash }
    it "without value" do
      subject.new.must_be_kind_of(HttpObjects::Hash)
    end
    it "with values" do
      hash = subject.new("MyObject" => "value")
      hash.myobject.must_be_instance_of(MyObject)
    end
    it "should reuse same object" do
      hash_headers = subject.new("MyObject" => "value")
      hash = subject.new(hash_headers)
      hash.must_be_same_as(hash_headers)
    end
  end

  describe "#[]=" do
    it "simple value" do
      subject["chave"] = "valor"
      subject["chave"].must_equal("valor")
    end
    it "HTTP Header value" do
      subject["MyObject"] = "value"
      subject.myobject.must_be_instance_of(MyObject)
    end
    it "without value" do
      subject["MyObject"].must_be_nil
    end
  end

  describe "#[]" do
    it "simple value" do
      subject["chave"] = "valor"
      subject["chave"].must_equal("valor")
    end
    it "returns value from http header" do
      subject["MyObject"] = "value"
      subject["MyObject"].must_equal("value")
    end
  end

  describe "#store as alias of []=" do
    it "simple value" do
      subject.store("chave", "valor")
      subject["chave"].must_equal("valor")
    end
    it "HTTP Header value" do
      subject.store("MyObject", "value")
      subject.myobject.must_be_instance_of(MyObject)
    end
  end

  it "header as instance method" do
    subject.store("MyObject", "value")

    subject.myobject.must_be_instance_of(MyObject)
    subject.myobject?.must_equal(true)
    subject.myobject!.must_equal("value")
  end

  it "keys, be case insensitive" do
    subject["My-Key"] = "value"
    subject["my-key"].must_equal("value")
  end

  it "#to_s" do
    subject["My-Key"] = "value"
    subject["MyObject"] = "myvalue"

    hash_in_rb18_sucks = /(my-key: value, myobject: myvalue)|(myobject: myvalue, my-key: value)/
    subject.to_s.must_match(hash_in_rb18_sucks)
  end

end
