class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_id
      t.integer :weight

      t.index :pokedex_id, unique: true
      t.timestamps
    end
  end
end
