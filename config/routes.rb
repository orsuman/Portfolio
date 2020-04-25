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
    resources :categories, only: [:index, :create, :edit, :update]
    resources :comments, only: [:destroy]
    resources :troubles, only: [:destroy]
    resources :inquiries, only: [:index, :show, :destroy]
  end


  devise_for :lawyers, :controllers => {
  :registrations => 'lawyers/registrations'
  }
  scope module: :lawyers do
    get 'lawyers/:id/withdraw' => 'lawyers#withdraw',as: 'lawyer_withdraw'
    get 'lawyers/:id/map' => 'map#show',as: 'map'
    resources :lawyers, only: [:show, :edit, :update, :destroy]
    resources :comments, only: [:new, :create] do
      collection do
        get :confirm
        post :confirm
        post :new, path: :new, as: :new, action: :back
      end
    end
  end


  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }
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
    resources :comments, only: [] do
      resource :references, only: [:create, :destroy]
    end
    resources :references, only: [:index]
  end

    resources :rooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
    resources :inquiries, only: [:new, :create] do
      collection do
        get :thanks
      end
  end


end