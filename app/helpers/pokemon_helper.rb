module PokemonHelper
  def pokemon_types(pokemon)
    pokemon.types.map { |type| type.name.capitalize }.sort.join(", ")
  end

  def card_color(types)
    type = types.map(&:name).min

    case type
    when "grass"
      "bg-green-600/60"
    when "fire"
      "bg-red-500/60"
    when "water"
      "bg-blue-500/60"
    when "electric"
      "bg-yellow-600/60"
    when "psychic"
      "bg-purple-500/60"
    when "ice"
      "bg-blue-300/60"
    when "dragon"
      "bg-purple-700/60"
    when "dark"
      "bg-gray-800/60"
    when "fairy"
      "bg-pink-300/60"
    when "normal"
      "bg-gray-400/60"
    when "fighting"
      "bg-red-800/60"
    when "flying"
      "bg-blue-200/60"
    when "poison"
      "bg-purple-800/60"
    when "ground"
      "bg-yellow-800/60"
    when "rock"
      "bg-yellow-700/60"
    when "bug"
      "bg-green-800/60"
    when "ghost"
      "bg-indigo-800/60"
    when "steel"
      "bg-gray-600/60"
    when "unknown"
      "bg-gray-500/60"
    when "shadow"
      "bg-gray-500/60"
    else
      "bg-gray-500/60"
    end
  end
end
