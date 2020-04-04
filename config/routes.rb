Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#top"
  get "home/about"
  get 'home/thanks' => 'home#thanks', as: 'thanks'

  devise_for :admin
    namespace :admin do
      resources :users, only: [:index, :show, :destroy] do
        member do
        patch 'restore'
        end
      end
      resources :lawyers, only: [:index, :show, :destroy] do
        member do
        patch 'restore'
        end
      end
      resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :lawyers
    scope module: :lawyers do
      get 'lawyers/:id/withdraw' => 'lawyers#withdraw',as: 'lawyer_withdraw'
      resources :lawyers, only: [:show, :edit, :update, :destroy]
  end

  devise_for :users
    scope module: :users do
      get 'users/:id/withdraw' => 'users#withdraw',as: 'user_withdraw'
      resources :troubles, only: [:index, :new, :create, :show] do
        collection do
          get :confirm
          post :confirm
          post :new, path: :new, as: :new, action: :back
        end
      end
      resources :users, only: [:show, :edit, :update, :destroy]
  end

end