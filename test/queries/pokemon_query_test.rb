#  frozen_string_literal

require "test_helper"

class PokemonQueryTest < ActiveSupport::TestCase
  test "::call with no query" do
    assert_equal Pokemon.all.count, PokemonQuery.call.count
  end

  test "::call with search query" do
    assert_equal [pokemons(:bulbasaur)], PokemonQuery.call(search: "bulbasaur")
  end
end
