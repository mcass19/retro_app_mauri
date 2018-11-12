# frozen_string_literal: true

Rails.application.routes.draw do
  # mount_ember_app :frontend, to: "/"
  # commented for now, to not break everything
  root 'home#index'

  resources :retrospectives, only: %i[index new]
  resource :retrospective, only: [] do
    post :post_mention_topics
    post :post_discuss_topics
    post :add_action_plan
    post :set_action_plan_owner
  end
end
