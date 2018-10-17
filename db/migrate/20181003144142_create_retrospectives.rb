# frozen_string_literal: true

# :nodoc:
class CreateRetrospectives < ActiveRecord::Migration[5.2]
  def change
    create_table :retrospectives do |t|
      t.string :title
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
