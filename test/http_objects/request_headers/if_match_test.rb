require "test_helper"

include HttpObjects::RequestHeaders

describe IfMatch do

  describe "*" do
    subject { IfMatch.parse("*") }
    it "should be Token object" do
      subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
    end
  end

  describe '"xyzzy"' do
    subject { IfMatch.parse('"xyzzy"') }
    it "should be EntityTags object" do
      subject.must_be_kind_of(HttpObjects::Parameters::EntityTags)
    end
  end

end
