require "test_helper"

class SpeciessTest < ActiveSupport::TestCase
  test "should save species with name" do
    species = Species.new(description: "Electric Mouse Pokemon", pokemon: pokemons(:bulbasaur))
    assert species.save
  end

  test "should not save species without name" do
    species = Species.new
    assert_not species.save
    assert species.errors.messages[:description].include?("can't be blank")
  end
end
