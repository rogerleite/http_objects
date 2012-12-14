require "test_helper"

describe HttpObjects::Headers::Entity::ContentType do

  let(:subject_class) { HttpObjects::Headers::Entity::ContentType }
  subject { subject_class.parse("text/html; charset=ISO-8859-4") }

  it "should be Media Type object" do
    subject.must_be_kind_of(HttpObjects::Parameters::MediaType)
  end

end
