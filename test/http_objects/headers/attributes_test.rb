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

  it "#support_header - define header as instance methods" do
    TestSubject.support_header(TestHeader)
    test_subject = TestSubject.new
    test_subject.must_respond_to(:content_type)
    test_subject.must_respond_to(:"content_type!")
    test_subject.must_respond_to(:"content_type?")
  end

end
