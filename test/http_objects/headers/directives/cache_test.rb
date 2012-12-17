require "test_helper"

include HttpObjects::Headers::Directives

describe Cache do

  describe "should accept empty declarations" do
    subject { Cache.parse("") }
    it "#raw" do
      subject.raw.must_be_empty
    end
    it "#value" do
      subject.value.must_be_empty
    end
    it "directives be false or zero" do
      subject.no_cache?.must_equal(false)
      subject.no_store?.must_equal(false)
      subject.max_age?.must_equal(false)
      subject.max_stale?.must_equal(false)
      subject.min_fresh?.must_equal(false)
      subject.no_transform?.must_equal(false)
      subject.only_if_cached?.must_equal(false)
      subject.public?.must_equal(false)
      subject.private?.must_equal(false)
      subject.must_revalidate?.must_equal(false)
      subject.proxy_revalidate?.must_equal(false)
      subject.s_maxage?.must_equal(false)
    end
  end

  describe "should accept one-directive declaration" do
    subject { Cache.parse("no-cache") }
    it "#no_cache? be true" do
      subject.no_cache?.must_equal(true)
    end
  end

  describe "should accept standalone directives" do
    subject { Cache.parse("no-cache, public") }

    it "#public?" do
      subject.public?.must_equal(true)
    end
  end

  describe "should accept multi-directive declaration" do
    subject { Cache.parse("no-cache, max-age=600, private = \"Accept\"") }

    it "#no_cache? be true" do
      subject.no_cache?.must_equal(true)
    end
    it "#max_age be 600" do
      subject.max_age?.must_equal(true)
      subject.max_age.value.must_equal(600)
    end
    it "#private be Accept" do
      subject.private!.must_equal("Accept")
    end
  end

  describe "should accept extension directives" do
    subject { Cache.parse("private, community=\"UCI\", stand-alone-extension") }

    it "should access extension directive with value" do
      subject["community"].must_equal("UCI")
    end
    it "should access extension directive without value" do
      subject.key?("stand-alone-extension").must_equal(true)
    end
  end

end
