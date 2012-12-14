require "test_helper"

include HttpObjects::Headers::Request

describe MaxForwards do

  subject { MaxForwards.parse("3") }

  it "should be Intger object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Digit)
  end

end
