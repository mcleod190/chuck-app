Rails.application.routes.draw do
  root "jokes#index"

  resources :jokes, only: [:index] do
    collection do
      get :random
      get :bless_me
    end
    member do
      post :like
    end
  end

  resources :subscribers, only: [:create] do
    collection do
      get :unsubscribe
      get :preview_email
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

