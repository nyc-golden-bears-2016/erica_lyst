Rails.application.routes.draw do

  root 'categories#index'

  resources :categories, except: [:delete] do
    resources :articles, shallow: true
  end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
