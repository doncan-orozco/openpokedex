# freeze_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pagy, @pokemons = pagy(Pokemon.all.eager_load(:types, :abilities))
  end

  def show
    @pokemon = Pokemon.eager_load(:types, :abilities, :species).find(params[:id])
  end
end
