Rails.application.routes.draw do
  resources :posts do
    resources :votes
  end
end
