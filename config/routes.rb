Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/show'
    get 'products/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'addresses/index'
  get 'addresses/edit'
  get 'orders/new'
  get 'orders/check'
  get 'orders/complete'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/check'
  get 'products/index'
  get 'products/show'
  get 'homes/top'
  get 'homes/about'
  get 'top/about'
  devise_for :admins
  devise_for :customers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
