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

describe LoAlpha do
  subject { LoAlpha.parse("TeSt") }
  it "#raw" do
    subject.raw.must_equal("TeSt")
  end
  it "#value" do
    subject.value.must_equal("test")
  end
end

nil_checks = [[Digit, 0], [UpAlpha, ""], [LoAlpha, ""]]
nil_checks.each do |(rule_class, value)|
  describe "#{rule_class.to_s} support nil" do
    subject { rule_class.parse(nil) }
    it "#raw" do
      subject.raw.must_be_nil
    end
    it "#value" do
      subject.value.must_equal(value)
    end
  end
end
