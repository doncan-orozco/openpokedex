# freeze_string_literal: true

class Type < ApplicationRecord
  has_many :pokemons_types, dependent: :destroy
  has_many :pokemons, through: :pokemons_types

  validates :name, presence: true, uniqueness: true
end
