Type.find_or_create_by!(name: "grass")
Type.find_or_create_by!(name: "poison")
Type.find_or_create_by!(name: "fire")
Type.find_or_create_by!(name: "flying")
Type.find_or_create_by!(name: "water")
Type.find_or_create_by!(name: "bug")
Type.find_or_create_by!(name: "normal")
Type.find_or_create_by!(name: "electric")
Type.find_or_create_by!(name: "ground")
Type.find_or_create_by!(name: "fairy")
Type.find_or_create_by!(name: "fighting")
Type.find_or_create_by!(name: "psychic")
Type.find_or_create_by!(name: "rock")
Type.find_or_create_by!(name: "steel")

Pokemon.find_or_create_by!(name: "bulbasaur", pokedex_id: 1, weight: 69) do |pokemon|
  pokemon.types << Type.find_by(name: "grass")
  pokemon
end
Pokemon.find_or_create_by!(name: "ivysaur", pokedex_id: 2, weight: 130) do |pokemon|
  pokemon.types << Type.find_by(name: "grass")
  pokemon
end
Pokemon.find_or_create_by!(name: "venusaur", pokedex_id: 3, weight: 1000) do |pokemon|
  pokemon.types << Type.find_by(name: "grass")
  pokemon
end
Pokemon.find_or_create_by!(name: "charmander", pokedex_id: 4, weight: 85) do |pokemon|
  pokemon.types << Type.find_by(name: "fire")
  pokemon
end
Pokemon.find_or_create_by!(name: "charmeleon", pokedex_id: 5, weight: 190) do |pokemon|
  pokemon.types << Type.find_by(name: "fire")
  pokemon
end
Pokemon.find_or_create_by!(name: "charizard", pokedex_id: 6, weight: 905) do |pokemon|
  pokemon.types << Type.find_by(name: "fire")
  pokemon.types << Type.find_by(name: "flying")
  pokemon
end
Pokemon.find_or_create_by!(name: "squirtle", pokedex_id: 7, weight: 90) do |pokemon|
  pokemon.types << Type.find_by(name: "water")
  pokemon
end
Pokemon.find_or_create_by!(name: "wartortle", pokedex_id: 8, weight: 225) do |pokemon|
  pokemon.types << Type.find_by(name: "water")
  pokemon
end
Pokemon.find_or_create_by!(name: "blastoise", pokedex_id: 9, weight: 855) do |pokemon|
  pokemon.types << Type.find_by(name: "water")
  pokemon
end
Pokemon.find_or_create_by!(name: "caterpie", pokedex_id: 10, weight: 29) do |pokemon|
  pokemon.types << Type.find_by(name: "bug")
  pokemon
end
Pokemon.find_or_create_by!(name: "metapod", pokedex_id: 11, weight: 99) do |pokemon|
  pokemon.types << Type.find_by(name: "bug")
  pokemon
end
