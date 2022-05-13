Rails.application.routes.draw do
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit]
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'
  #『/users/~』のroutesとpathの
  devise_for :users
end
