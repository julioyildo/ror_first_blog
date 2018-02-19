Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'


  #ADMIN
  devise_for :admins

  #KEDITOR
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  #ERROR
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  

  #POSTS
  root to: "posts#index"
  resources :posts do
    resources :comments
  end 

end
