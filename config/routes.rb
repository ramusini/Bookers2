Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit]
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'
  #『/users/~』のroutesとpathの
end
