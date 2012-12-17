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

end
