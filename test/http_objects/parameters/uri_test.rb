require "test_helper"

include HttpObjects::Parameters

describe Uri do

  describe "http://server.com/absolute" do
    subject { Uri.parse("http://server.com/absolute") }
    it "#raw" do
      subject.raw.must_equal("http://server.com/absolute")
    end
    it "#value be URI object" do
      subject.value.must_be_instance_of(::URI::HTTP)
    end
  end

  describe "/relative_path" do
    subject { Uri.parse("/relative_path") }
    it "#raw" do
      subject.raw.must_equal("/relative_path")
    end
    it "#value be URI object" do
      subject.value.must_be_instance_of(::URI::Generic)
    end
  end

  describe "nil value" do
    subject { Uri.parse(nil) }
    it "#raw" do
      subject.raw.must_be_nil
    end
    it "#value be nil" do
      subject.value.must_be_nil
    end
  end
end
