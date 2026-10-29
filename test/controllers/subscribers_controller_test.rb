require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should create subscriber and send welcome email" do
    assert_difference -> { Subscriber.count }, 1 do
      assert_emails 1 do
        post subscribers_url, params: {
          subscriber: {
            email: "new_soldier@example.com",
            name: "New Soldier",
            blessing_tone: "Mighty Texas Ranger"
          }
        }
      end
    end

    assert_redirected_to root_url(anchor: "subscribe")
    follow_redirect!
    assert_select "main"
  end

  test "should handle duplicate subscription gracefully" do
    existing = subscribers(:one)
    assert_no_difference -> { Subscriber.count } do
      post subscribers_url, params: {
        subscriber: {
          email: existing.email,
          name: "Existing Warrior"
        }
      }
    end

    assert_redirected_to root_url(anchor: "subscribe")
  end

  test "should unsubscribe via token" do
    sub = subscribers(:one)
    assert sub.active?

    get unsubscribe_subscribers_url(token: sub.unsubscribe_token)
    assert_response :success
    assert_not sub.reload.active?
    assert_select "h1", text: /UNSUBSCRIBED/
  end

  test "should preview email" do
    get preview_email_subscribers_url
    assert_response :success
    assert_includes response.body, "CHUCK NORRIS"
  end
end

