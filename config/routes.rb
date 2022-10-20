Rails.application.routes.draw do
  # devise_for :customers,skip: [:passwords], controllres: {
  #   registration: "public/registration",
  #   sessions: 'public/sessions'
  # devise_for :customers,skip: [:passwords, :registrations] 
  # as :customer do 
  #     get 'customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
  #     post 'customers/sign_up', to: 'public/registrations#create', as: :customer_registration
  #   end 
  
  
   # devise_for :admins, skip: [:registrations, :passwords], controllres: {
  #   #registration: "admin/registration",
  #   sessions: "admin/sessions"
  # }
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  
  scope module: :public do
    devise_for :customers,skip: [:passwords, :registrations] 
      as :customer do 
      get 'customers/sign_up', to: 'registrations#new', as: :new_customer_registration
      post 'customers/sign_up', to: 'registrations#create', as: :customer_registration
    end 
    get 'homes/top' => 'homes#top', as: 'top' 
    get 'homes/about' => 'homes#about', as: 'about'  #public_about_path
    resources :items,        :only => [:index, :show]
    get 'customers/exit' => 'customers#exit', as: 'exit'
    patch 'customers/period' => 'customers#period', as: 'period'
    resources :customers,    :only => [:show, :edit, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all' #destroy_all_path
    resources :cart_items,   :only => [:index, :update, :create, :destroy]
    post 'orders/confirmation' => 'orders#confirmation', as: 'confirmation'
    get 'orders/completion' => 'orders#completion', as: 'completion'
    resources :orders,        :only => [:new, :index, :show, :create]
    resources :addresses,   :except => [:new, :show]
    
  end
  
 
  
  namespace :admin do
    resources :genres,    :only => [:index, :create, :edit, :update]
    resources :customers, :only => [:index, :show, :edit, :update]
    resources :orders,     :only => [:show, :update]
    resources :order_details, :only => [:update]
    resources :items,     :except => [:destroy]
    get 'homes/top' => 'homes#top', as: 'top' 
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
