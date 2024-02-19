# freeze_string_literal: true

class Ability < ApplicationRecord
  has_many :pokemons_abilities, dependent: :destroy
  has_many :pokemons, through: :pokemons_abilities

  validates :name, presence: true, uniqueness: true
end
