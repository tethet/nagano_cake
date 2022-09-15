Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllres: {
    registration: "public/registration",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    get 'homes/top' => 'homes#top', as: 'top'
    get 'homes/about' => 'homes#about', as: 'about'
    resources :items,        :only => [:index, :show]
    resources :customers,    :only => [:show, :edit, :update]
    get 'customers/exit' => 'customers#exit', as: 'exit'
    patch 'customers/period' => 'customers#period', as: 'period'
    resources :cart_items,   :only => [:index, :update, :create, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all' #destroy_all_path
    resources :order,        :only => [:new, :index, :show]
    post 'order/confirmation' => 'odrder#confirmation', as: 'confirmation'
    get 'order/completion' => 'odrder#completion', as: 'completion'
    resources :deliveries,   :except => [:new, :show]
    
  end
  
  devise_for :admins, skip: [:registrations, :passwords], controllres: {
    registration: "admin/registration",
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'homes/about' => 'homes#about', as: 'about'#admin_about_path
    resources :items,     :except => :destroy
    resources :genres,    :only => [:index, :create, :edit, :update]
    resources :customers, :only => [:index, :show, :edit, :update]
    resources :order,     :only => [:show, :update]
    resources :order_details, :only => [:update]
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
