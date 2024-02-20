# freeze_string_literal: true

class Pokemon < ApplicationRecord
  has_closure_tree

  has_many :pokemons_types, dependent: :destroy
  has_many :types, through: :pokemons_types
  has_one :species, dependent: :destroy

  has_many :pokemons_abilities, dependent: :destroy
  has_many :abilities, through: :pokemons_abilities

  validates :name, presence: true
  validates :pokedex_id, presence: true, uniqueness: true
  validates :weight, presence: true
end
