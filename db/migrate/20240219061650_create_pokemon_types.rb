class CreatePokemonTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :types do |t|
      t.string :name
      t.index :name, unique: true

      t.timestamps
    end

    create_table :pokemons_types do |t|
      t.belongs_to :pokemon
      t.belongs_to :type

      t.timestamps
    end
  end
end
