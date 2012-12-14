require "test_helper"

class TestHeader
  def self.header_name
    "Content-Type"
  end
end

class TestSubject
  extend HttpObjects::Headers::Attributes
end

describe HttpObjects::Headers::Attributes do

  it "#support_header - register header on .headers" do
    TestSubject.support_header(TestHeader)
    TestSubject.headers.must_equal({"Content-Type" => TestHeader})
  end

  it "#support_header - should yield block if given" do
    flag = "out block"
    TestSubject.support_header(TestHeader) do |h|
      h.must_be_same_as(TestHeader)
      flag = "inner block"
    end
    flag.must_equal("inner block")
  end

end
