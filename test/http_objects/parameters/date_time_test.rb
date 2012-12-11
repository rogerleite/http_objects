require "test_helper"

describe HttpObjects::Parameters::DateTime do

  let(:subject_class) { HttpObjects::Parameters::DateTime }

  describe "Sun, 06 Nov 1994 08:49:37 GMT" do
    subject { subject_class.parse("Sun, 06 Nov 1994 08:49:37 GMT") }
    it "#raw" do
      subject.raw.must_equal("Sun, 06 Nov 1994 08:49:37 GMT")
    end
    it "#value be instance Time" do
      subject.value.must_be_instance_of(::Time)
    end
    it "#value" do
      subject.value.strftime("%Y-%m-%d %H:%M:%S %z").must_equal("1994-11-06 06:49:37 -0200")
    end
  end

  describe "Sunday, 06-Nov-94 08:49:37 GMT" do
    subject { subject_class.parse("Sunday, 06-Nov-94 08:49:37 GMT") }
    it "#raw" do
      subject.raw.must_equal("Sunday, 06-Nov-94 08:49:37 GMT")
    end
    it "#value be instance Time" do
      subject.value.must_be_instance_of(::Time)
    end
    it "#value" do
      subject.value.strftime("%Y-%m-%d %H:%M:%S %z").must_equal("1994-11-06 06:49:37 -0200")
    end
  end

  describe "fail in silence" do
    subject { subject_class.parse("Sunday, XXX") }
    it "#raw" do
      subject.raw.must_equal("Sunday, XXX")
    end
    it "#value be nil" do
      subject.value.must_be_nil
    end
  end

end
