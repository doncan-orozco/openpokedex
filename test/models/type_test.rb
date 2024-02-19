require "test_helper"

class TypeTest < ActiveSupport::TestCase
  test "should save type with name" do
    type = Type.new(name: "Electric")
    assert type.save
  end

  test "should not save type without name" do
    type = Type.new
    assert_not type.save
    assert type.errors.messages[:name].include?("can't be blank")
  end
end
