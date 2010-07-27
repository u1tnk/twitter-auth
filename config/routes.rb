Rails.application.routes.draw do
  resource :session
  
  match '/login', :to => 'sessions#new', :as => :login
  match '/logout', :to => 'sessions#destroy', :as => :logout
  match '/oauth_callback', :to => 'sessions#oauth_callback', :as => 'oauth_callback'
end
