require "test_helper"

class JokeTest < ActiveSupport::TestCase
  test "requires content" do
    joke = Joke.new
    assert_not joke.valid?
    assert_includes joke.errors[:content], "can't be blank"
  end

  test "can upvote a joke" do
    joke = jokes(:one)
    initial_likes = joke.likes_count
    joke.upvote!
    assert_equal initial_likes + 1, joke.reload.likes_count
  end

  test "returns joke of the day" do
    joke = Joke.joke_of_the_day
    assert_not_nil joke
    assert joke.is_a?(Joke)
  end

  test "returns random joke" do
    joke = Joke.random_joke
    assert_not_nil joke
  end

  test "filters by category" do
    grit_jokes = Joke.by_category("Texas Ranger Grit")
    assert grit_jokes.all? { |j| j.category == "Texas Ranger Grit" }
  end
end

