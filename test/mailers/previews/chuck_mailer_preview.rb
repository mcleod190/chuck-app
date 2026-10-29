class ChuckMailerPreview < ActionMailer::Preview
  def welcome_blessing
    subscriber = Subscriber.first || Subscriber.create!(
      email: "soldier@example.com",
      name: "Walker Fan",
      blessing_tone: "Mighty Texas Ranger"
    )
    ChuckMailer.welcome_blessing(subscriber)
  end

  def daily_roundhouse
    subscriber = Subscriber.first || Subscriber.create!(
      email: "soldier@example.com",
      name: "Walker Fan",
      blessing_tone: "Delta Force Thunder"
    )
    joke = Joke.joke_of_the_day || Joke.first
    ChuckMailer.daily_roundhouse(subscriber, joke)
  end
end
