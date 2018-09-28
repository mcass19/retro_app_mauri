# frozen_string_literal: true

json.extract! retrospective, :id, :title, :date, :description,
              :created_at, :updated_at
json.url retrospective_url(retrospective, format: :json)
