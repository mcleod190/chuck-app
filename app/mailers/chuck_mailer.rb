class ChuckMailer < ApplicationMailer
  default from: %("Chuck Norris" <blessings@chucknorrisapproved.com>)

  def welcome_blessing(subscriber)
    @subscriber = subscriber
    @joke = Joke.joke_of_the_day || Joke.first
    @blessing = @subscriber.daily_blessing
    @unsubscribe_url = unsubscribe_subscribers_url(token: @subscriber.unsubscribe_token)

    mail(
      to: @subscriber.email,
      subject: "⚡ Chuck Norris has noticed you! Your Daily Blessing & Welcome Joke"
    )
  end

  def daily_roundhouse(subscriber, joke = nil)
    @subscriber = subscriber
    @joke = joke || Joke.joke_of_the_day || Joke.first
    @blessing = @subscriber.daily_blessing
    @unsubscribe_url = unsubscribe_subscribers_url(token: @subscriber.unsubscribe_token)

    mail(
      to: @subscriber.email,
      subject: "🤠 Chuck Norris Daily Wisdom & Personal Blessing for Today!"
    )
  end
end

