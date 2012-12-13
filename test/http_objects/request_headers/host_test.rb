require "test_helper"

include HttpObjects::RequestHeaders

describe Host do

  subject { Host.parse("www.w3.org") }

  it "should be Uri object" do
    subject.must_be_kind_of(HttpObjects::Parameters::Uri)
  end

end
