Rails.application.routes.draw do

  root 'post#index'
  devise_for :users
  resources :posts do
    resources :votes
  end
end
