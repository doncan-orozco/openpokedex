# frozen_string_literal: true

class CreateEvolutionsService < ApplicationService
  def initialize(evolution_chain_response)
    @evolution_chain_response = evolution_chain_response
    @pokemon_chain = []
  end

  def process
    create_pokemon_evolution_chain
    create_closure_tree
  end

  private

  attr_reader :evolution_chain_response
  attr_accessor :pokemon_chain

  def create_pokemon_evolution_chain
    chain = evolution_chain_response["chain"]
    id = chain["species"]["url"].split("/").last

    pokemon_chain << CreateOrUpdatePokemonWithAssociationsService.for(chain["species"]["name"], id)

    while chain["evolves_to"].present?
      chain = chain["evolves_to"].first
      id = chain["species"]["url"].split("/").last
      pokemon_chain << CreateOrUpdatePokemonWithAssociationsService.for(chain["species"]["name"], id)
    end

    pokemon_chain
  end

  def create_closure_tree
    pokemon_chain.each_with_index do |pokemon, index|
      if index > 0
        pokemon.add_child(pokemon_chain[index - 1])
      end
    end
  end
end
