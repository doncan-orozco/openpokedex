# freeze_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.eager_load(:types, :abilities)
  end

  def show
    @pokemon = Pokemon.eager_load(:types, :abilities, :species).find(params[:id])
  end
end
