Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post 'download_and_send_email', to: 'home#download_and_send_email'
end
