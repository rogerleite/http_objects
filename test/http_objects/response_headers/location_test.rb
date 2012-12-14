require "test_helper"

include HttpObjects::Headers::Response

describe Location do

  subject { Location.parse("http://www.w3.org/pub/WWW/People.html") }

  it "should be Uri object" do
    subject.must_be_kind_of(HttpObjects::Parameters::Uri)
  end

end
