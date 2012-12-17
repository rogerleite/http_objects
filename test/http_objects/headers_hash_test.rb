require "test_helper"

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
