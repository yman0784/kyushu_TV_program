Rails.application.routes.draw do
  devise_for :users
  root to: 'tv_programs#index'
  resources :tv_programs, only: [:index, :destroy, :show] 
  get 'tv_program/find', to: "tv_programs#find"
  post 'tv_program/top', to: "tv_programs#top"
  # get 'tv_program/top_show', to: "tv_programs#top_show" 
  resources :prefecture_programs do
    resources :comments, only: :create
  end
end
