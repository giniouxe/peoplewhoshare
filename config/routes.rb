Rails.application.routes.draw do
  scope '/:locale' do
    root 'pages#home'

    resources :places
  end
end
