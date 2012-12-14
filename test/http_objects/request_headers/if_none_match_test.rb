require "test_helper"

include HttpObjects::Headers::Request

describe IfNoneMatch do

  describe "*" do
    subject { IfNoneMatch.parse("*") }
    it "should be Token object" do
      subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
    end
  end

  describe '"xyzzy"' do
    subject { IfNoneMatch.parse('"xyzzy"') }
    it "should be EntityTags object" do
      subject.must_be_kind_of(HttpObjects::Parameters::EntityTags)
    end
  end

end
