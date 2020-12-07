class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end
Rails.application.routes.draw do
  get 'product_reviews/new'
  get 'product_reviews/create'
  constraints SubdomainConstraint do
    resources :products do
      resources :product_reviews, only: [ :new, :create ]
    end
  end
  resources :shops
  root 'products#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: [ :index, :show ]
    end
  end
end
