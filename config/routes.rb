Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  root 'static_pages#home', controller: "application#index"
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



  resources :locations, :categories,:courses do
    member do
      get :categories
      get :courses
      post :course_add
      post :course_remove
      post :category_add
      post :category_remove
      post :courses_thumbsup
      post :courses_thumbsdown 
    end
  end
  resources :users

  resources :courses do
    resources :likes
    resources :unlikes
  end

  resources :contact, only: [:new, :create, :edit ]
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
