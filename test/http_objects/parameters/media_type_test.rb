require "test_helper"

describe HttpObjects::Parameters::MediaType do

  let(:subject_class) { HttpObjects::Parameters::MediaType }

  describe "text/html; charset=ISO-8859-4" do

    subject { subject_class.parse("text/html; charset=ISO-8859-4") }

    it "#raw" do
      subject.raw.must_equal("text/html; charset=ISO-8859-4")
    end
    it "#value" do
      subject.value.must_equal("text/html")
    end
    it "#parameters" do
      subject.parameters.must_equal("charset" => "ISO-8859-4")
    end
  end

end
