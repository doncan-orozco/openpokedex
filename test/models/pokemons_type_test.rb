require "test_helper"

class PokemonsTypeTest < ActiveSupport::TestCase
  test "should save pokemons_type with pokemon_id and type_id" do
    pokemons_type = PokemonsType.new(pokemon: pokemons(:bulbasaur), type: types(:grass))
    assert pokemons_type.save
  end

  test "should not save pokemons_type without pokemon_id" do
    pokemons_type = PokemonsType.new
    assert_not pokemons_type.save
  end

  test "should not save pokemons_type without type_id" do
    pokemons_type = PokemonsType.new
    assert_not pokemons_type.save
  end
end
