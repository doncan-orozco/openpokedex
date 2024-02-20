# frozen_string_literal: true

require "test_helper"

class PokeapiClientTest < ActiveSupport::TestCase
  setup do
    @client = PokeapiClient.new
  end

  test "#get_pokemon" do
    pokemon_response = {name: "bulbasaur", id: 1}

    stub_request(:get, PokeapiClient.base_uri + "/pokemon/1")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      ).to_return(status: 200, body: pokemon_response.to_json, headers: {})

    response = @client.get_pokemon(1)
    assert_equal pokemon_response.to_json, response.body
  end

  test "#get_pokemon_species" do
    species_response = {evolution_chain: {url: "https://pokeapi.co/api/v2/evolution-chain/1"}}

    stub_request(:get, PokeapiClient.base_uri + "/pokemon-species/1")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      ).to_return(status: 200, body: species_response.to_json, headers: {})

    response = @client.get_pokemon_species(1)
    assert_equal species_response.to_json, response.body
  end

  test "#get_pokemon_evolution_chain" do
    evolution_chain_response = {chain: {species: {name: "bulbasaur"}}}

    stub_request(:get, PokeapiClient.base_uri + "/evolution-chain/1")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      ).to_return(status: 200, body: evolution_chain_response.to_json, headers: {})

    response = @client.get_evolution_chain(1)
    assert_equal evolution_chain_response.to_json, response.body
  end

  test "#get_pokemons" do
    pokemon_list_response = {results: [{name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1"}]}

    stub_request(:get, PokeapiClient.base_uri + "/pokemon?offset=0&limit=20")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      ).to_return(status: 200, body: pokemon_list_response.to_json, headers: {})

    response = @client.get_pokemons
    assert_equal pokemon_list_response.to_json, response.body
  end

  test "#get_all_evolution_chains" do
    evolution_chains_response = {results: [{url: "https://pokeapi.co/api/v2/evolution-chain/1"}]}

    stub_request(:get, PokeapiClient.base_uri + "/evolution-chain?limit=999")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      ).to_return(status: 200, body: evolution_chains_response.to_json, headers: {})

    response = @client.get_all_evolution_chains
    assert_equal evolution_chains_response.to_json, response.body
  end
end
