Rails.application.routes.draw do
  resources :recipes
  post 'recipes/validate', to: 'recipes#validate'
  post 'recipes', to: 'recipes#create'
  delete 'recipes', to: 'recipes#destroy'
end
