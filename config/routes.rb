Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :projects, only: [:index, :show]

  # get '/projects' => 'projects#index' 

end
