require "test_helper"

include HttpObjects::Headers::Entity

describe ContentLanguage do

  subject { ContentLanguage.parse("text/html; charset=ISO-8859-4") }

  it "should be Language Tags object" do
    subject.must_be_kind_of(HttpObjects::Parameters::LanguageTags)
  end

end
