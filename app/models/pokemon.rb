# freeze_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemons_types, dependent: :destroy
  has_many :types, through: :pokemons_types

  validates :name, presence: true, uniqueness: true
  validates :pokedex_id, presence: true, uniqueness: true
  validates :weight, presence: true
end
