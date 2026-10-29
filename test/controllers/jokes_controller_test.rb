require "test_helper"

class JokesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    assert_select "h1", text: /CHUCK NORRIS/
  end

  test "should get index with category filter" do
    get root_url(category: "Texas Ranger Grit")
    assert_response :success
  end

  test "should get random joke as json" do
    get random_jokes_url, as: :json
    assert_response :success
    data = JSON.parse(response.body)
    assert data["content"].present?
    assert data["movie_title"].present?
  end

  test "should like joke" do
    joke = jokes(:one)
    initial_likes = joke.likes_count

    post like_joke_url(joke), as: :json
    assert_response :success
    data = JSON.parse(response.body)
    assert_equal initial_likes + 1, data["likes_count"]
  end

  test "should get instant blessing" do
    get bless_me_jokes_url(name: "Walker", tone: "Mighty Texas Ranger")
    assert_response :success
    data = JSON.parse(response.body)
    assert_includes data["blessing"], "Walker"
  end
end

