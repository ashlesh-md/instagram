Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'follows/index'
      get 'follows/create'
      resources :users do
        get 'posts', on: :member, to: 'users#posts'
        get 'notifications', on: :member, to: 'users#notifications'
      end
      resources :posts do
        get 'likes', on: :member, to: 'posts#likes'
      end
      resources :comments
      resources :likes
      resources :follows
    end
  end
end
