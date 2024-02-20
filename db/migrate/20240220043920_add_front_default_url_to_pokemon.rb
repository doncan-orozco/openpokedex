class AddFrontDefaultUrlToPokemon < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :front_default_url, :string
    add_column :pokemons, :pokemon_response, :jsonb

    add_column :species, :species_response, :jsonb
  end
end
