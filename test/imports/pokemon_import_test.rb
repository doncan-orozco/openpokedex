# frozen_string_literal: true

require "test_helper"

class PokemonImportTest < ActiveSupport::TestCase
  test "::call" do
    pokemon = Pokemon.new
    pokemon_response = {name: "squirtle", id: 7, weight: 90, types: [{type: {name: "water"}}], abilities: [{ability: {name: "torrent"}}]}

    PokemonImport.call(pokemon, pokemon_response)
    assert_equal pokemon_response[:name], pokemon.name
    assert_equal pokemon_response[:id], pokemon.pokedex_id
    assert_equal pokemon_response[:weight], pokemon.weight
    assert_equal pokemon_response[:types].first[:type][:name], pokemon.types.first.name
    assert_equal pokemon_response[:abilities].first[:ability][:name], pokemon.abilities.first.name
  end
end
