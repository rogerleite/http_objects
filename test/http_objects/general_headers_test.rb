require "test_helper"

include HttpObjects::GeneralHeaders

describe Connection do
  subject { Connection.parse("close") }
  it "should be Token object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
  end
end

describe HttpObjects::GeneralHeaders::Date do
  subject { HttpObjects::GeneralHeaders::Date.parse("Tue, 15 Nov 1994 08:12:31 GMT") }
  it "should be DateTime object" do
    subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
  end
end

describe Trailer do
  subject { Trailer.parse("") }
  it "should be Token object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
  end
end

describe Upgrade do
  subject { Upgrade.parse("HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11") }
  it "should be Token object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
  end
end

describe Via do
  subject { Via.parse("1.0 fred, 1.1 nowhere.com (Apache/1.1)") }
  it "should be Token object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
  end
end

describe Warning do
  subject { Warning.parse("") }
  it "should be Token object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Token)
  end
end
