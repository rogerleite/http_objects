require "test_helper"

describe HttpObjects::Headers do

  subject { HttpObjects::Headers.new }

  describe "include all HTTP Headers" do
    subject { HttpObjects::Headers.headers.values }
    it "include General Headers" do
      HttpObjects::GeneralHeaders.headers.each do |h|
        subject.must_include(h)
      end
    end
    it "include Entity Headers" do
      HttpObjects::EntityHeaders.headers.each do |h|
        subject.must_include(h)
      end
    end
    it "include Request Headers" do
      HttpObjects::RequestHeaders.headers.each do |h|
        subject.must_include(h)
      end
    end
    it "include Response Headers" do
      HttpObjects::ResponseHeaders.headers.each do |h|
        subject.must_include(h)
      end
    end
  end

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
