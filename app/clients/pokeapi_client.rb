# frozen_string_literal: true

class PokeapiClient
  include HTTParty

  base_uri "https://pokeapi.co/api/v2"
  PAGINATION_LIMIT = 20
  attr_accessor :limit

  def initialize(limit = PAGINATION_LIMIT)
    @limit = limit
  end

  def get_pokemon(name_or_id)
    self.class.get("/pokemon/#{name_or_id}")
  end

  def get_pokemon_species(name_or_id)
    self.class.get("/pokemon-species/#{name_or_id}")
  end

  def get_evolution_chain(id)
    self.class.get("/evolution-chain/#{id}")
  end

  def get_pokemons(offset = 0)
    self.class.get("/pokemon?offset=#{offset}&limit=#{limit}")
  end

  def get_all_evolution_chains
    self.class.get("/evolution-chain?limit=999")
  end
end
