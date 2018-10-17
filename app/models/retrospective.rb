# frozen_string_literal: true

# :nodoc:
class Retrospective < ApplicationRecord
  validates :title, :description, :date, presence: true
end
