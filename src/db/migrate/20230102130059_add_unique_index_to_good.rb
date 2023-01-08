# frozen_string_literal: true

class AddUniqueIndexToGood < ActiveRecord::Migration[7.0]
  def up
    add_index :goods, :url, unique: true
  end

  def down
    remove_index :goods, column: :url, unique: true
  end
end
