require "test_helper"

class PokemonsAbilitiesTest < ActiveSupport::TestCase
  test "should save pokemons_ability with pokemon_id and ability_id" do
    pokemons_ability = PokemonsAbility.new(pokemon: pokemons(:bulbasaur), ability: abilities(:overgrow))
    assert pokemons_ability.save
  end

  test "should not save pokemons_ability without pokemon_id" do
    pokemons_ability = PokemonsAbility.new
    assert_not pokemons_ability.save
    assert pokemons_ability.errors.messages[:pokemon].include?("must exist")
  end

  test "should not save pokemons_ability without ability_id" do
    pokemons_ability = PokemonsAbility.new
    assert_not pokemons_ability.save
    assert pokemons_ability.errors.messages[:ability].include?("must exist")
  end
end
