# frozen_string_literal: true

Rails.application.routes.draw do
  root 'retrospectives#landing_page'

  resources :retrospectives
end
