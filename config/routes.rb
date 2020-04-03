Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#top"
  get "home/about"

  devise_for :admin
    namespace :admin do
      resources :users, only: [:index, :show, :destroy]
      resources :lawyers, only: [:index, :show, :destroy]
      resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :lawyers
    namespace :lawyers do
      resource :lawyers, only: [:show, :edit, :update, :destroy]
      resources :users, only: [:show]
  end

  devise_for :users
    scope module: :users do
      resources :troubles, only: [:index, :new, :create, :show] do
        collection do
          get :confirm
          post :confirm
          post :new, path: :new, as: :new, action: :back
        end
      end
      resource :user, only: [:show, :edit, :update, :destroy]
  end

end