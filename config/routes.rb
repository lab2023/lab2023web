Lab2023web::Application.routes.draw do


  root :to => 'pages#index'

  match "/works" => "projects#index", :as => :works_path
  match "/team" => "teams#index", :as => :team_path
  match "/contact" => "pages#contact", :as => :contact_path

  devise_for :admins, :controllers => { :sessions => "admins/sessions", :registrations =>  "admins/registrations"}
  namespace :admins do
    resources :dashboard
    resources :teams
    resources :projects do
      resources :project_pictures
    end
    resources :open_sources
  end

  resources :teams, :only => [:index]
  resources :projects, :only => [:index, :show]
  resources :open_sources, :only => [:index, :show]

  devise_for :users
end
