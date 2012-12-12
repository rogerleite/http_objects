require "test_helper"

describe HttpObjects::GeneralHeaders::Date do

  subject { HttpObjects::GeneralHeaders::Date.parse("Tue, 15 Nov 1994 08:12:31 GMT") }

  it "should be DateTime object" do
    subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
  end

end
