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
  resources :users
  resources :projects

  scope ':tenant_name' do
    resources :projects
  end

  root 'users#new'
end
