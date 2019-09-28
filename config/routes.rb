Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :fighters, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :battles, only: [:index, :new, :show, :create] do
    get :result, on: :member
  end
end
