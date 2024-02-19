require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  test "should save pokemon with name, pokedex_id, and weight" do
    pokemon = Pokemon.new(name: "Pikachu", pokedex_id: 25, weight: 60)
    assert pokemon.save
  end

  test "should not save pokemon without name" do
    pokemon = Pokemon.new
    assert_not pokemon.save
    assert pokemon.errors.messages[:name].include?("can't be blank")
  end

  test "should not save pokemon with duplicate name" do
    pokemon = Pokemon.new(name: "bulbasaur")
    assert_not pokemon.save
    assert pokemon.errors.messages[:name].include?("has already been taken")
  end

  test "should not save pokemon with duplicate pokedex_id" do
    pokemon = Pokemon.new(pokedex_id: 1)
    assert_not pokemon.save
    assert pokemon.errors.messages[:pokedex_id].include?("has already been taken")
  end

  test "should not save pokemon without pokedex_id" do
    pokemon = Pokemon.new
    assert_not pokemon.save
    assert pokemon.errors.messages[:pokedex_id].include?("can't be blank")
  end

  test "should not save pokemon without weight" do
    pokemon = Pokemon.new
    assert_not pokemon.save
    assert pokemon.errors.messages[:weight].include?("can't be blank")
  end
end
