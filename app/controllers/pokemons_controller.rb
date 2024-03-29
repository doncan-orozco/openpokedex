# freeze_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pagy, @pokemons = pagy(PokemonQuery.call(**query).eager_load(:types, :abilities))
  end

  def show
    @pokemon = Pokemon.eager_load(:types, :abilities, :species).find(params[:id])
    @pokemon_family = @pokemon.root&.self_and_descendants&.eager_load(:types, :abilities, :species)&.reverse || Pokemon.none
    @next_pokemon = Pokemon.where("pokedex_id > ?", @pokemon.pokedex_id).order(:pokedex_id).first
    @prev_pokemon = Pokemon.where("pokedex_id < ?", @pokemon.pokedex_id).order(:pokedex_id).last
  end

  private

  def query
    {
      search: params.dig(:q, :search)&.downcase
    }
  end
end
