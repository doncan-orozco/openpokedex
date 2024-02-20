class RemoveJsonbResponses < ActiveRecord::Migration[7.1]
  def change
    remove_column :species, :species_response, :jsonb
    remove_column :pokemons, :pokemon_response, :jsonb
  end
end
