require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  test "requires valid email" do
    sub = Subscriber.new(email: "")
    assert_not sub.valid?

    sub.email = "not-an-email"
    assert_not sub.valid?

    sub.email = "valid.warrior@example.com"
    assert sub.valid?
  end

  test "enforces email uniqueness" do
    existing = subscribers(:one)
    duplicate = Subscriber.new(email: existing.email.upcase)
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "generates unsubscribe token on create" do
    sub = Subscriber.create!(email: "unique_new@example.com")
    assert_not_nil sub.unsubscribe_token
    assert sub.unsubscribe_token.length >= 20
  end

  test "generates personalized daily blessing" do
    sub = subscribers(:one)
    blessing = sub.daily_blessing
    assert_not_nil blessing
    assert_includes blessing, sub.display_name
  end

  test "can unsubscribe" do
    sub = subscribers(:one)
    assert sub.active?
    sub.unsubscribe!
    assert_not sub.reload.active?
  end
end

