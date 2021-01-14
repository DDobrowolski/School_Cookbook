Rails.application.routes.draw do
  resources :recipes
  post 'recipes/validate', to: 'recipes#validate'
end
