class Subscriber < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }

  validates :blessing_tone, inclusion: { in: ChuckBlessingService.tones }, allow_blank: true

  before_validation :set_defaults, on: :create
  before_save :normalize_email

  scope :active, -> { where(active: true) }

  def display_name
    name.presence || "Warrior"
  end

  def daily_blessing(date = Date.current)
    ChuckBlessingService.blessing_for(
      name: display_name,
      tone: blessing_tone.presence || ChuckBlessingService::DEFAULT_TONE,
      date: date
    )
  end

  def unsubscribe!
    update(active: false)
  end

  private

  def set_defaults
    self.unsubscribe_token ||= SecureRandom.urlsafe_base64(32)
    self.blessing_tone = ChuckBlessingService::DEFAULT_TONE if blessing_tone.blank?
    self.active = true if active.nil?
  end

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end

