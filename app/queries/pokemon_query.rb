class PokemonQuery < ApplicationQuery
  def query
    scope = @scope
    scope = scope.where("LOWER(pokemons.name) LIKE ?", "%#{q[:search]}%") if q[:search].present?
    scope.order(:pokedex_id)
  end
end
