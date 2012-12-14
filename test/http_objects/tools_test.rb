require "test_helper"

describe HttpObjects::Tools do

  TestObject = Class.new

  subject { Object.new.extend(HttpObjects::Tools) }

  describe "Header" do
    it "creates Class" do
      header_class = subject.Header("name", TestObject)
      header_class.new.must_be_kind_of(TestObject)
    end
    it "creates Class with header_name" do
      header_class = subject.Header("name", TestObject)
      header_class.header_name.must_equal("name")
    end
    it "creates Class using block" do
      header_class = subject.Header("custom") do
        def self.parse(value)
          "#{value} header class!"
        end
      end
      header_class.parse("custom").must_equal("custom header class!")
    end
  end
end
