namespace :chuck do
  desc "Send Chuck Norris daily joke & blessing to all active subscribers"
  task deliver_daily_blessings: :environment do
    joke = Joke.joke_of_the_day || Joke.first
    count = 0
    Subscriber.active.find_each do |subscriber|
      ChuckMailer.daily_roundhouse(subscriber, joke).deliver_later
      count += 1
    end
    puts "⚡ Successfully dispatched Chuck Norris daily blessing to #{count} warrior(s)!"
  end
end
