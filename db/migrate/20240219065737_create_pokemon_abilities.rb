class CreatePokemonAbilities < ActiveRecord::Migration[7.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.index :name, unique: true

      t.timestamps
    end

    create_table :pokemons_abilities do |t|
      t.belongs_to :pokemon
      t.belongs_to :ability

      t.timestamps
    end
  end
end
