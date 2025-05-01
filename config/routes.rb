Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #Routes pour gerer les articles
  root "articles#home"
  
  resources :articles do 
    resources :comments, except: [:index, :show]  
  end

  namespace :admin do 
    resources :articles
  end
  
  
#Routes pour gerer les commentaire

  #post "/articles/:id/new_comment", to: "comments#create",as: "create_comment"
  #post "/articles", to: "articles#create",as: "articles"
  
  

  #get "/articles/:id/comments/:comment_id/edit", to: "comments#edit", as: "edit_comment"
#put "/articles/:id/comments/:comment_id", to: "comments#update", as: "update_comment"
  
  #delete "/articles/:id/comments/:comment_id", to: "comments#destroy", as: "delete_comment"
  
  #patch "/articles/:article_id/comments/:id/toggle_status_commentaire", to: "articles#toggle_status_comments",as: "toggle_status_comments"

  # Defines the root path route ("/")
  # root "posts#index"
end
