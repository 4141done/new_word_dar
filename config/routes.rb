NewWordDar::Application.routes.draw do

  patch 'refresh_statistics', to: 'home#refresh_statistics'
  root 'home#index'
end
