Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllres: {
    registration: "public/registration",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords], controllres: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
