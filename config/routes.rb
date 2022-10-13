Rails.application.routes.draw do
  resources :books, only:[:index, :create, :show, :edit, :update, :destroy]
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
