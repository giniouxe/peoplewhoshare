Rails.application.routes.draw do
  scope '(:locale)', locale: /en|fr/ do
    root 'pages#home'

    resources :places
  end
end
