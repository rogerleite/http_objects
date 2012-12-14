require "test_helper"

include HttpObjects::Headers::Request

describe IfRange do

  describe "entity-tag" do
    subject { IfRange.parse('W/"xyzzy"') }
    it "should be EntityTags object" do
      subject.must_be_kind_of(HttpObjects::Parameters::EntityTags)
    end
  end

  describe "HTTP-date" do
    subject { IfRange.parse("Sat, 29 Oct 1994 19:43:31 GMT") }
    it "should be Date Time object" do
      subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
    end
  end

end
