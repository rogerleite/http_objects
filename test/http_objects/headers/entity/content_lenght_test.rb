require "test_helper"

include HttpObjects::Headers::Entity

describe ContentLength do

  subject { ContentLength.parse("3495") }

  it "should be BasicRules::Digit object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Digit)
  end

end
