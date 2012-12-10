require "test_helper"

include HttpObjects::EntityHeaders

describe Allow do

  subject { Allow.parse("GET, HEAD, PUT") }

  it "should be BasicRules::UpAlpha object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::UpAlpha)
  end

end
