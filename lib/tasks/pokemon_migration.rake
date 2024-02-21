# frozen_string_literal: true

namespace :pokemon_migration do
  desc "Create pokemons and their evolutions by id chain."
  task :create_pokemons_and_evolutions_by_id_chain, [:chain_id] => [:environment] do |t, args|
    client = PokeapiClient.new
    puts "Fetching evolution chain #{args[:chain_id]}..."
    chain_response = client.get_evolution_chain(args[:chain_id])
    CreateEvolutionsService.for(chain_response)
    puts "Done!"
  end

  desc "Catch 'Em All"
  task fetch_all_pokemons: :environment do
    client = PokeapiClient.new
    puts "Fetching all pokemons..."
    evolution_chains = client.get_all_evolution_chains
    evolution_chains["results"].each do |chain|
      chain_id = chain["url"].split("/").last
      puts "Fetching evolution chain #{chain_id} of #{evolution_chains["count"]}..."
      chain_response = client.get_evolution_chain(chain_id)
      CreateEvolutionsService.for(chain_response)
    end
    puts "Done!"
  end
end
