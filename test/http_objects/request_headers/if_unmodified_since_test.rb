require "test_helper"

include HttpObjects::Headers::Request

describe IfUnmodifiedSince do

  subject { IfUnmodifiedSince.parse("Sat, 29 Oct 1994 19:43:31 GMT") }

  it "should be Date Time object" do
    subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
  end

end
