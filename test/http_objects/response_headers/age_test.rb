require "test_helper"

include HttpObjects::ResponseHeaders

describe Age do

  subject { Age.parse("3") }

  it "should be Integer object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Digit)
  end

end
