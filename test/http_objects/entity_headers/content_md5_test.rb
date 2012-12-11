require "test_helper"

include HttpObjects::EntityHeaders

describe ContentMD5 do

  subject { ContentMD5.parse("aad883420fe64e865ba1725e5617222c") }

  it "should be Octet object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::Octet)
  end

end
