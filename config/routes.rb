Rails.application.routes.draw do
  
  devise_for :users

  authenticated :user do
    root to: "projects#index", as: :authenticated_root
  end

  root 'welcome#index'


  resources :projects, only: [:index, :show, :new, :create, :destroy] do
    resources :tasks, only: [:create, :update]
  end

  # get '/projects' => 'projects#index' 

end
