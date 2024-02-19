require "test_helper"

class AbilityTest < ActiveSupport::TestCase
  test "should save ability with name" do
    ability = Ability.new(name: "Thunderbolt")
    assert ability.save
  end

  test "should not save ability without name" do
    ability = Ability.new
    assert_not ability.save
    assert ability.errors.messages[:name].include?("can't be blank")
  end
end
