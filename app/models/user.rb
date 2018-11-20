# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  validates :username, :email, :password, :profile_img, presence: true
end
