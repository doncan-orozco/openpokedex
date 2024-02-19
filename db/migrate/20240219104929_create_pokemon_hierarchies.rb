class CreatePokemonHierarchies < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :pokemon_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "pokemon_anc_desc_idx"

    add_index :pokemon_hierarchies, [:descendant_id],
      name: "pokemon_desc_idx"
  end
end
