class AddParentIdToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :parent_id, :integer
  end
end
