# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :retrospectives, only: %i[index new]
end
