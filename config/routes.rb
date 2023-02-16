Rails.application.routes.draw do

 # 顧客用
 # URL /customers/sign_in ...
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
 }

  scope module: :public do
    root to: "homes#top"
    get "/about"=>"homes#about"
    resources :products, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update] do
      get :check, on: :collection
      get :withdrowl, on: :collection
      resource :addresses, only: [:index, :edit, :create, :update, :destroy]
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete :destroy_all, on: :collection
    end
    resources :orders, only: [:new, :create, :index, :show] do
      post :check, on: :member
      get :complete, on: :collection
    end
  end

  namespace :admin do
    root to: "admin/homes#top"
    resources :products, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, onlyonly: [:show, :update]
    resources :order_products, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
