Rails.application.routes.draw do
  resources :tasks

  get '/health', to: proc { [200, {}, ['OK']] }
end
