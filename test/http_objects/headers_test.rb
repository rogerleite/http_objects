require "test_helper"

describe HttpObjects::Headers do

  subject { HttpObjects::Headers.new }

  describe "#[]=" do
    it "simple value" do
      subject["chave"] = "valor"
      subject["chave"].must_equal("valor")
    end
    it "HTTP Header value" do
      subject["Allow"] = "get, post"
      subject["Allow"].must_be_instance_of(HttpObjects::EntityHeaders::Allow)
    end
    it "without value" do
      subject["Allow"].must_be_nil
    end
  end

  describe "#store as alias of []=" do
    it "simple value" do
      subject.store("chave", "valor")
      subject["chave"].must_equal("valor")
    end
    it "HTTP Header value" do
      subject.store("Allow", "get, post")
      subject["Allow"].must_be_instance_of(HttpObjects::EntityHeaders::Allow)
    end
  end

  it "header as instance method" do
    subject["Allow"] = "get, post"
    subject.allow.must_be_instance_of(HttpObjects::EntityHeaders::Allow)
    subject.allow?.must_equal(true)
    subject.allow!.must_equal("get, post")
  end

end
