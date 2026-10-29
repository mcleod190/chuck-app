class Joke < ApplicationRecord
  validates :content, presence: true

  scope :featured, -> { where(featured: true) }
  scope :ordered_by_likes, -> { order(likes_count: :desc, created_at: :desc) }
  scope :by_category, ->(cat) { where(category: cat) if cat.present? }

  CATEGORIES = [
    "General Badassery",
    "Movie Legends",
    "Martial Arts",
    "Physics & Cosmos",
    "Texas Ranger Grit"
  ].freeze

  def self.joke_of_the_day
    total = count
    return nil if total.zero?

    # Deterministic index based on date (epoch days)
    day_index = (Date.current.mjd) % total
    order(:id).offset(day_index).first || first
  end

  def self.random_joke(exclude_id = nil)
    rel = all
    rel = rel.where.not(id: exclude_id) if exclude_id.present? && count > 1
    rel.order("RANDOM()").first || first
  end

  def upvote!
    increment!(:likes_count)
  end

  def movie_badge
    movie_title.presence || "Classic Chuck Fact"
  end
end

