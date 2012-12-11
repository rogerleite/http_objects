require "test_helper"

include HttpObjects::Parameters

describe LanguageTags do

  describe "en, en-US, en-cockney, i-cherokee, x-pig-latin" do
    subject { LanguageTags.parse("en, en-US, en-cockney, i-cherokee, x-pig-latin") }
    it "#raw" do
      subject.raw.must_equal("en, en-US, en-cockney, i-cherokee, x-pig-latin")
    end
    it "#value be Array of languages" do
      subject.value.must_equal(%w{en en-US en-cockney i-cherokee x-pig-latin})
    end
  end

  describe "pt-br" do
    subject { LanguageTags.parse("pt-br") }
    it "#raw" do
      subject.raw.must_equal("pt-br")
    end
    it "#value be Array of languages" do
      subject.value.must_equal(%w{pt-br})
    end
  end

  describe "nil value" do
    subject { LanguageTags.parse(nil) }
    it "#raw" do
      subject.raw.must_be_nil
    end
    it "#value be Array of languages" do
      subject.value.must_equal([])
    end
  end
end
