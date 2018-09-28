# frozen_string_literal: true

# :nodoc:
class CreateRetrospectives < ActiveRecord::Migration[5.2]
  def change
    create_table :retrospectives do |t|
      t.string :title
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
