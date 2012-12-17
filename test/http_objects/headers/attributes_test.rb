require "test_helper"

class TestSubject
  extend HttpObjects::Headers::Attributes
end

describe HttpObjects::Headers::Attributes do

  MyAttribute = Class.new

  it "#register_attribute - register header on .attributes" do
    TestSubject.register_attribute("MyAttribute", MyAttribute)
    TestSubject.attributes.must_equal({"MyAttribute" => MyAttribute})
  end

  it "#register_attribute - should yield block if given" do
    flag = "out block"
    TestSubject.register_attribute("MyAttribute", MyAttribute) do |name, h|
      name.must_equal("MyAttribute")
      h.must_be_same_as(MyAttribute)
      flag = "inner block"
    end
    flag.must_equal("inner block")
  end

end
