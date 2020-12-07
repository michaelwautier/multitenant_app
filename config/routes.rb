class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end
Rails.application.routes.draw do
  constraints SubdomainConstraint do
    resources :shops
  end
  resources :products
  root 'products#index'
end
