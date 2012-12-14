require "test_helper"

include HttpObjects::Parameters

describe EntityTags do

  describe '"123456789"' do
    subject { EntityTags.parse('"123456789"') }
    it "#raw" do
      subject.raw.must_equal('"123456789"')
    end
    it "#value be quoted String" do
      subject.value.must_equal('"123456789"')
    end
    it "#weak?" do
      subject.weak?.must_equal(false)
    end
  end

  describe 'W/"123456789"' do
    subject { EntityTags.parse('W/"123456789"') }
    it "#raw" do
      subject.raw.must_equal('W/"123456789"')
    end
    it "#value be quoted String" do
      subject.value.must_equal('"123456789"')
    end
    it "#weak?" do
      subject.weak?.must_equal(true)
    end
  end

  describe "parse invalid header" do
    subject { EntityTags.parse('\WABCDEF1234567') }
    it "#raw" do
      subject.raw.must_equal('\WABCDEF1234567')
    end
    it "#value be empty String" do
      subject.value.must_equal("")
    end
  end

end
