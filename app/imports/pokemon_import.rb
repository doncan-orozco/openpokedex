# frozen_string_literal: true

class PokemonImport < ApplicationImport
  def import
    record.update!(attributes)
    record.types << types
    record.abilities << abilities
    record
  end

  private

  def attributes
    {name: response["name"],
     pokedex_id: response["id"],
     weight: response["weight"]}
  end

  def types
    response["types"].map do |type|
      Type.find_or_create_by(name: type["type"]["name"])
    end
  end

  def abilities
    response["abilities"].map do |ability|
      Ability.find_or_create_by(name: ability["ability"]["name"])
    end
  end
end
