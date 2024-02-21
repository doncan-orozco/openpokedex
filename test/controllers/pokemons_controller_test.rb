require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemons_url
    assert_response :success
  end

  test "should get show" do
    get pokemon_url(pokemons(:bulbasaur))
    assert_response :success
  end
end
