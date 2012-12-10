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

describe UpAlpha do
  subject { UpAlpha.parse("TeSt") }
  it "#raw" do
    subject.raw.must_equal("TeSt")
  end
  it "#value" do
    subject.value.must_equal("TEST")
  end
end
