Rails.application.routes.draw do

  root    'static_page#home'
  get     'static_page/home'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resource :profile, except: [:new, :create]
  resources :projects do
    resources :releases do
      member do
        get :close
      end
    end
  end
end
