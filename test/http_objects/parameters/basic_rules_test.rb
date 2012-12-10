require "test_helper"

include HttpObjects::Parameters::BasicRules

describe Digit do
  subject { Digit.parse("1024") }
  it "#raw" do
    subject.raw.must_equal("1024")
  end
  it "#value" do
    subject.value.must_equal(1024)
  end
end
