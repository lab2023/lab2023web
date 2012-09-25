Lab2023web::Application.routes.draw do

  root :to => 'pages#index'

  devise_for :admins, :controllers => { :sessions => "admins/sessions", :registrations =>  "admins/registrations"}
  namespace :admins do
    resources :dashboard
    resources :teams
    resources :projects
    resources :open_sources
  end

  resources :teams, :only => [:index]
  resources :projects, :only => [:index, :show]
  resources :open_sources, :only => [:index, :show]

  devise_for :users
end
