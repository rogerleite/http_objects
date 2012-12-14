require "test_helper"

describe HttpObjects::Headers::Entity::LastModified do

  let(:subject_class) { HttpObjects::Headers::Entity::LastModified }
  subject { subject_class.parse("Sun, 06 Nov 1994 08:49:37 GMT") }

  it "should be Date Time object" do
    subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
  end

end
