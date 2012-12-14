require "test_helper"

include HttpObjects::Headers::Entity

describe ContentEncoding do

  subject { ContentEncoding.parse("Gzip") }

  it "should be BasicRules::LoAlpha object" do
    subject.must_be_kind_of(HttpObjects::Parameters::BasicRules::LoAlpha)
  end

end
