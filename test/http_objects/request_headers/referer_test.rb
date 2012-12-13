require "test_helper"

include HttpObjects::RequestHeaders

describe Referer do

  subject { Referer.parse("http://www.w3.org/hypertext/DataSources/Overview.html") }

  it "should be Uri object" do
    subject.must_be_kind_of(HttpObjects::Parameters::Uri)
  end

end
