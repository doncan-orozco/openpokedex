# freeze_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pagy, @pokemons = pagy(Pokemon.eager_load(:types, :abilities).order(:pokedex_id))
  end

  def show
    @pokemon = Pokemon.eager_load(:types, :abilities, :species).find(params[:id])
    @pokemons = @pokemon.root&.self_and_descendants&.eager_load(:types, :abilities, :species)&.reverse || Pokemon.none
  end
end
