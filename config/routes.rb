Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :projects, only: [:index, :show, :new, :create, :destroy]

  # get '/projects' => 'projects#index' 

end
