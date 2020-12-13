# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :contacts
    get '404', to: 'application#render404'
    root 'contacts#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
