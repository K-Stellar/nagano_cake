Rails.application.routes.draw do


  scope module: :public do
    root to: "homes#top"
    get "/about"=>"homes#about"
    resources :products, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update] do
      get :check, on: :collection
      patch :withdrawal, on: :collection
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete :destroy_all, on: :collection
    end
    resources :orders, only: [:new, :create, :index, :show] do
      post :check, on: :collection
      get :complete, on: :collection
    end
    resources :genres, only: [:show]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  namespace :admin do
    root to: "homes#top"
    resources :products, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_products, only: [:update]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end