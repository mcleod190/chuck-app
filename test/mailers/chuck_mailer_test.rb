require "test_helper"

class ChuckMailerTest < ActionMailer::TestCase
  test "welcome_blessing email" do
    sub = subscribers(:one)
    mail = ChuckMailer.welcome_blessing(sub)

    assert_equal ["ranger_one@example.com"], mail.to
    assert_includes mail.subject, "Chuck Norris has noticed you"
    assert_match(/Cordell Fan/, mail.body.encoded)
    assert_match(/Chuck Norris/, mail.body.encoded)
  end

  test "daily_roundhouse email" do
    sub = subscribers(:one)
    joke = jokes(:one)
    mail = ChuckMailer.daily_roundhouse(sub, joke)

    assert_equal ["ranger_one@example.com"], mail.to
    assert_includes mail.subject, "Chuck Norris Daily Wisdom"
    assert_match(/Cordell Fan/, mail.body.encoded)
    assert_match(/giraffes/, mail.body.encoded)
  end
end
