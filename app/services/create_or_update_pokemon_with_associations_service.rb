# frozen_string_literal: true

class CreateOrUpdatePokemonWithAssociationsService < ApplicationService
  def initialize(name, id)
    @name = name
    @id = id
  end

  def process
    pokemon = Pokemon.find_or_initialize_by(name: name)

    Pokemon.transaction do
      pokemon_response = pokeapi_client.get_pokemon(id)
      species_response = pokeapi_client.get_pokemon_species(id)

      pokemon = PokemonImport.call(pokemon, pokemon_response)
      pokemon_species = Species.find_or_initialize_by(pokemon: pokemon)
      SpeciesImport.call(pokemon_species, species_response)
    end

    pokemon
  end

  private

  attr_reader :name, :id

  def pokeapi_client
    @pokeapi_client ||= PokeapiClient.new
  end
end
