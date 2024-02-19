class CreateSpecies < ActiveRecord::Migration[7.1]
  def change
    create_table :species do |t|
      t.string :description
      t.belongs_to :pokemon

      t.timestamps
    end
  end
end
