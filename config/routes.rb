NewWordDar::Application.routes.draw do

  patch 'refresh_statistics', to: 'home#refresh_statistics'
  root 'home#index'

  resources :skip_words, only: [:new, :create, :index]
  resources :crawl_queues
end
