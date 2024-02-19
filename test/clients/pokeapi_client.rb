require "test_helper"

class PokeapiClientTest < ActiveSupport::TestCase
  setup do
    @client = PokeapiClient.new
  end

  test "#get_pokemon" do
    pokemon_response = {name: "bulbasaur", id: 1}

    stub_request(:get, PokeapiClient.base_uri + "/pokemon/1")
      .with(
        body: pokemon_response.to_json,
        headers: {
          "Content-Type" => "application/json",
          "Accept" => "application/json"
        }
      )

    response = @client.get_pokemon(1)
    assert_equal pokemon_response, response
  end

  test "#get_pokemon_species" do
    species_response = {evolution_chain: {url: "https://pokeapi.co/api/v2/evolution-chain/1"}}

    stub_request(:get, PokeapiClient.base_uri + "/pokemon-species/1")
      .with(
        body: species_response.to_json,
        headers: {
          "Content-Type" => "application/json",
          "Accept" => "application/json"
        }
      )

    response = @client.get_pokemon_species(1)
    assert_equal species_response, response
  end

  test "#get_pokemon_evolution_chain" do
    evolution_chain_response = {chain: {species: {name: "bulbasaur"}}}

    stub_request(:get, PokeapiClient.base_uri + "/evolution-chain/1")
      .with(
        body: evolution_chain_response.to_json,
        headers: {
          "Content-Type" => "application/json",
          "Accept" => "application/json"
        }
      )

    response = @client.get_pokemon_evolution_chain(1)
    assert_equal evolution_chain_response, response
  end

  test "#get_pokemons" do
    pokemon_list_response = {results: [{name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1"}]}

    stub_request(:get, PokeapiClient.base_uri + "/pokemon?offset=0&limit=20")
      .with(
        body: pokemon_list_response.to_json,
        headers: {
          "Content-Type" => "application/json",
          "Accept" => "application/json"
        }
      )

    response = @client.get_pokemons
    assert_equal pokemon_list_response, response
  end
end
