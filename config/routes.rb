Rails.application.routes.draw do
  resources :estimates, :only => [:new, :create, :index, :show]

  get 'welcome/index'
  root 'welcome#index'
end
