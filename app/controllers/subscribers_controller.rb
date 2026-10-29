class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.find_or_initialize_by(email: subscriber_params[:email].to_s.strip.downcase)
    
    is_new_or_reactivated = @subscriber.new_record? || !@subscriber.active?
    @subscriber.assign_attributes(subscriber_params)
    @subscriber.active = true

    if @subscriber.save
      if is_new_or_reactivated
        begin
          ChuckMailer.welcome_blessing(@subscriber).deliver_now
        rescue => e
          Rails.logger.error("Mailer failed: #{e.message}")
        end
        flash[:notice] = "💥 BOOM! Welcome aboard, #{@subscriber.display_name}. Chuck Norris has personally approved your subscription! Check your inbox for your welcome blessing."
      else
        flash[:notice] = "🤠 You're already enlisted in Chuck's daily ranks, #{@subscriber.display_name}! Your daily blessings are actively flowing."
      end
      redirect_to root_path(anchor: "subscribe")
    else
      redirect_to root_path(anchor: "subscribe"), alert: "⚠️ Chuck rejected that request: #{@subscriber.errors.full_messages.to_sentence}."
    end
  end

  def unsubscribe
    @subscriber = Subscriber.find_by(unsubscribe_token: params[:token])

    if @subscriber
      @subscriber.unsubscribe!
      @farewell_quote = "Chuck Norris saw you leave. He won't hunt you down... today. May your days be safe anyway."
    else
      @farewell_quote = "Invalid or expired token. Even Chuck Norris couldn't find this record."
    end
  end

  def preview_email
    @subscriber = Subscriber.active.first || Subscriber.new(email: "preview@example.com", name: "Ranger Friend", blessing_tone: "Mighty Texas Ranger")
    @joke = Joke.joke_of_the_day || Joke.first
    @blessing = @subscriber.daily_blessing
    @unsubscribe_url = unsubscribe_subscribers_url(token: @subscriber.unsubscribe_token || "sample-token")

    render "chuck_mailer/daily_roundhouse", layout: false
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :name, :blessing_tone)
  end
end

