Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
  end

  root 'posts#index'
  
  resources :signup ,only: [:index] do
    collection do
      get 'registration'
      post 'registration' => 'signup#first_validation'
      get 'sms_authentication'
      post 'sms_authentication' => 'signup#sms_check'
      get 'address'
      post 'address' => 'signup#second_validation'
      get 'done'
    end
  end

  resources :posts

end
