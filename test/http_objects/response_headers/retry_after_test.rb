require "test_helper"

include HttpObjects::Headers::Response

describe RetryAfter do

  describe "support date time format" do
    subject { RetryAfter.parse("Fri, 31 Dec 1999 23:59:59 GMT") }
    it "should be Date Time object" do
      subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
    end
  end

  describe "delta-seconds" do
    subject { RetryAfter.parse("120") }
    it "should be Integer object" do
      subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Digit)
    end
  end

end
