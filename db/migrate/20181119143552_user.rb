# frozen_string_literal: true

# :nodoc:
class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :profile_img

      t.timestamps
    end
  end
end
