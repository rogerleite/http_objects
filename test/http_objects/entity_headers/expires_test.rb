require "test_helper"

describe HttpObjects::EntityHeaders::Expires do

  let(:subject_class) { HttpObjects::EntityHeaders::Expires }
  subject { subject_class.parse("Sun, 06 Nov 1994 08:49:37 GMT") }

  it "should be Date Time object" do
    subject.must_be_kind_of(HttpObjects::Parameters::DateTime)
  end

end
