Pokemon.find_or_create_by!(name: "bulbasaur", pokedex_id: 1, weight: 69) do |pokemon|
  pokemon.types << Type.find_or_create_by!(name: "grass")
  pokemon.abilities << Ability.find_or_create_by!(name: "overgrow")
  pokemon.build_species(description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.")

  ivysaur = Pokemon.find_or_create_by!(name: "ivysaur", pokedex_id: 2, weight: 130) do |pokemon|
    pokemon.types << Type.find_or_create_by!(name: "grass")
    pokemon.abilities << Ability.find_or_create_by!(name: "overgrow")
    Species.find_or_create_by!(description: "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.", pokemon: pokemon)
    pokemon
  end

  venusaur = Pokemon.find_or_create_by!(name: "venusaur", pokedex_id: 3, weight: 1000) do |pokemon|
    pokemon.types << Type.find_or_create_by!(name: "grass")
    pokemon.abilities << Ability.find_or_create_by!(name: "overgrow")
    pokemon.build_species(description: "There is a large flower on Venusaur's back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower's aroma soothes the emotions of people.")
    pokemon
  end

  pokemon.add_child ivysaur
  ivysaur.add_child venusaur
  pokemon
end

Pokemon.find_or_create_by!(name: "charmander", pokedex_id: 4, weight: 85) do |pokemon|
  pokemon.types << Type.find_or_create_by!(name: "fire")
  pokemon.abilities << Ability.find_or_create_by!(name: "blaze")
  pokemon.build_species(description: "The flame at the tip of its tail makes a sound as it burns. You can only hear it in quiet places.")

  charmeleon = Pokemon.find_or_create_by!(name: "charmeleon", pokedex_id: 5, weight: 190) do |pokemon|
    pokemon.types << Type.find_or_create_by!(name: "fire")
    pokemon.abilities << Ability.find_or_create_by!(name: "blaze")
    pokemon.build_species(description: "It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.")
    pokemon
  end
  charizard = Pokemon.find_or_create_by!(name: "charizard", pokedex_id: 6, weight: 905) do |pokemon|
    pokemon.types << Type.find_or_create_by!(name: "fire")
    pokemon.types << Type.find_or_create_by!(name: "flying")
    pokemon.abilities << Ability.find_or_create_by!(name: "blaze")
    pokemon.build_species(description: "It spits fire that is hot enough to melt boulders. It may cause forest fires by blowing flames.")
    pokemon
  end

  pokemon.add_child charmeleon
  charmeleon.add_child charizard
  pokemon
end

Pokemon.find_or_create_by!(name: "squirtle", pokedex_id: 7, weight: 90) do |pokemon|
  pokemon.types << Type.find_or_create_by!(name: "water")
  pokemon.abilities << Ability.find_or_create_by!(name: "torrent")
  pokemon.build_species(description: "After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.")

  wartortle = Pokemon.find_or_create_by!(name: "wartortle", pokedex_id: 8, weight: 225) do |pokemon|
    pokemon.types << Type.find_or_create_by!(name: "water")
    pokemon.abilities << Ability.find_or_create_by!(name: "torrent")
    pokemon.build_species(description: "It is recognized as a symbol of longevity. If its shell has algae on it, that Wartortle is very old.")
    pokemon
  end
  blastoise = Pokemon.find_or_create_by!(name: "blastoise", pokedex_id: 9, weight: 855) do |pokemon|
    pokemon.types << Type.find_or_create_by!(name: "water")
    pokemon.abilities << Ability.find_or_create_by!(name: "torrent")
    pokemon.build_species(description: "The rocket cannons on its shell fire jets of water capable of punching holes through thick steel.")
    pokemon
  end

  pokemon.add_child wartortle
  wartortle.add_child blastoise
  pokemon
end
