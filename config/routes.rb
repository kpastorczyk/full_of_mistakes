Rails.application.routes.draw do
  get 'products/seed', controller: 'products', action: 'seed'
  get 'products/expensive_categories', controller: 'products', action: 'expensive_categories'
  resources :products do
    collection do
      get 'uniq_categories'
    end
  end
  # get 'products/uniq_categories', to: 'products/uniq_categories'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
