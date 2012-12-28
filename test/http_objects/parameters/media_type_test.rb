require "test_helper"

include HttpObjects::Parameters

describe MediaType do

  it "support nil value" do
    subject = MediaType.parse(nil)
    subject.must_be_instance_of(MediaType)
    subject.raw.must_be_nil
    subject.value.must_equal("")
  end

  describe "with only type/subtype" do
    subject { MediaType.parse("text/html") }
    it "#raw" do
      subject.raw.must_equal("text/html")
    end
    it "#value" do
      subject.value.must_equal("text/html")
    end
    it "#parameters" do
      subject.parameters.must_be_empty
    end
  end

  describe "with type/subtype and one parameter" do
    subject { MediaType.parse("application/xhtml+xml; charset=ISO-8859-4") }
    it "#raw" do
      subject.raw.must_equal("application/xhtml+xml; charset=ISO-8859-4")
    end
    it "#value" do
      subject.value.must_equal("application/xhtml+xml")
    end
    it "#parameters" do
      subject.parameters.must_equal("charset" => "ISO-8859-4")
    end
  end

  describe "#charset" do
    describe "with value" do
      subject { MediaType.parse("application/xhtml+xml; charset=ISO-8859-4") }
      it "#charset?" do
        subject.charset?.must_equal(true)
      end
      it "#charset!" do
        subject.charset!.must_equal("ISO-8859-4")
      end
    end
    describe "without value" do
      subject { MediaType.parse("application/xhtml+xml") }
      it "#charset?" do
        subject.charset?.must_equal(false)
      end
      it "#charset!" do
        subject.charset!.must_be_nil
      end
    end
  end

end
