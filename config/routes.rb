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
    scope module: :lawyers do
  end

  devise_for :users
    scope module: :users do
      get 'troubles_confirm' => 'troubles#confirm', as: 'troubles_confirm'
      resources :troubles, only: [:index, :new, :create, :show]
  end

end