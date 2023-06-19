Rails.application.routes.draw do
  devise_for :users

  root "blog_posts#index"
  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end
end
