require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/movies.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Movie.count, data.length
  end

  test "show" do
    get "/movies/#{Movie.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "year", "lead_actor", "sales", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Movie.count", 1 do
      post "/movies.json", params: { movie:  {name: "lake", year: 800, lead_actor: 600, sales: 1000 } }
      assert_response 200
    end
  end
  test "update" do
    movie = Movie.first
    patch "/movies/#{movie.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end
  test "destroy" do
    assert_difference "Movie.count", -1 do
      delete "/movies/#{Movie.first.id}.json"
      assert_response 200
    end
  end
end
