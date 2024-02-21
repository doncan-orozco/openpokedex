# frozen_string_literal: true

require "test_helper"

class CreateOrUpdatePokemonWithAssociationsServiceTest < ActiveSupport::TestCase
  setup do
    @mock = Minitest::Mock.new
    @mock.expect :get_pokemon, {name: "squirtle", id: 7, weight: 90, types: [{type: {name: "water"}}], abilities: [{ability: {name: "torrent"}}]}, [7]
    @mock.expect :get_pokemon_species, {flavor_text_entries: [{flavor_text: "squirtle description", language: {name: "en"}}], genera: [{genus: "Seed"}], evolution_chain: {url: "https://pokeapi.co/api/v2/evolution-chain/3/"}}, [7]
  end

  test "::for" do
    PokeapiClient.stub :new, @mock do
      pokemon = CreateOrUpdatePokemonWithAssociationsService.for("squirtle", 7)
      assert_equal "squirtle", pokemon.name
      assert_equal 7, pokemon.pokedex_id
      assert_equal 90, pokemon.weight
      assert_equal "water", pokemon.types.first.name
      assert_equal "torrent", pokemon.abilities.first.name
      assert_equal "squirtle description", pokemon.species.description
    end

    assert_mock @mock
  end
end
