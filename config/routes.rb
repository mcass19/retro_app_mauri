# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :retrospectives, only: %i[index new]
  resource :retrospective, only: [] do
    post :post_mention_topics
    post :post_discuss_topics
  end
end
