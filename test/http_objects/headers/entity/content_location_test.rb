require "test_helper"

include HttpObjects::Headers::Entity

describe ContentLocation do

  subject { ContentLocation.parse("/relative_path") }

  it "should be Uri object" do
    subject.must_be_kind_of(HttpObjects::Parameters::Uri)
  end

end
