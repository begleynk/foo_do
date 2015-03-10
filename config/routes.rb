Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :projects, only: [:index, :show, :new, :create, :destroy] do
    resources :tasks, only: [:create, :update]
  end

  # get '/projects' => 'projects#index' 

end
