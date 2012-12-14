require "test_helper"

include HttpObjects::Headers::Response

describe ETag do

  subject { ETag.parse("W/ABCDE123456") }

  it "should be EntityTags object" do
    subject.must_be_kind_of(HttpObjects::Parameters::EntityTags)
  end

end
