# frozen_string_literal: true

class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end
Rails.application.routes.draw do
  constraints SubdomainConstraint do
    resources :users
  end
  resources :projects
  resources :users


  root 'users#new'
end
