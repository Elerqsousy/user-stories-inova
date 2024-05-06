Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :create, :new] do
    end
  end

  shallow do
    scope '/post' do
      resources :comments, :rates
    end
  end
  
  root "users#index"
end
