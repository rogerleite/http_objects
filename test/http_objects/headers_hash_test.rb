require "test_helper"

describe HttpObjects::HeadersHash do

  subject { HttpObjects::HeadersHash.new }

  it "kind of HttpObjects::Hash" do
    subject.must_be_kind_of(HttpObjects::Hash)
  end

  it "include all HTTP Headers" do
    subject = HttpObjects::HeadersHash.attributes.values
    HttpObjects::Headers.headers.each do |h|
      subject.must_include(h)
    end
  end

  describe "#initialize" do
    subject { HttpObjects::HeadersHash }
    it "with values" do
      hash = subject.new("MyObject" => "value", "Content-Type" => "text/plain")
      hash["MyObject"].must_equal("value")
      hash.content_type.wont_be_nil
      hash.content_type.value.must_equal("text/plain")
    end
  end

end
