class JokesController < ApplicationController
  def index
    @joke_of_the_day = Joke.joke_of_the_day || Joke.first
    @current_category = params[:category].presence
    
    scope = Joke.all
    scope = scope.where(category: @current_category) if @current_category.present?
    @jokes = scope.ordered_by_likes

    @subscriber = Subscriber.new
    @tones = ChuckBlessingService.tones
    @categories = Joke::CATEGORIES
    @random_blessing = ChuckBlessingService.random_blessing
  end

  def random
    exclude_id = params[:exclude_id]
    @joke = Joke.random_joke(exclude_id)

    respond_to do |format|
      format.json do
        render json: {
          id: @joke.id,
          content: @joke.content,
          movie_title: @joke.movie_title,
          character_name: @joke.character_name,
          scene_description: @joke.scene_description,
          image_url: helpers.asset_path(helpers.scene_image_path(@joke)),
          category: @joke.category,

          likes_count: @joke.likes_count
        }
      end
      format.html { render partial: "joke_card", locals: { joke: @joke } }
    end
  end

  def like
    @joke = Joke.find(params[:id])
    @joke.upvote!

    respond_to do |format|
      format.json { render json: { id: @joke.id, likes_count: @joke.likes_count } }
      format.html { redirect_back fallback_location: root_path, notice: "💥 Roundhouse like recorded!" }
    end
  end

  def bless_me
    name = params[:name].presence || "Warrior"
    tone = params[:tone].presence || ChuckBlessingService::DEFAULT_TONE
    blessing = ChuckBlessingService.random_blessing(name: name, tone: tone)

    render json: { blessing: blessing, name: name, tone: tone }
  end
end

