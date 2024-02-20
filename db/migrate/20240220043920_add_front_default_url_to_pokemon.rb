class AddFrontDefaultUrlToPokemon < ActiveRecord::Migration[7.1]
  def change
    change_table :pokemons, bulk: true do |t|
      t.string :front_default_url
      t.jsonb :pokemon_response
    end

    add_column :species, :species_response, :jsonb
  end
end
