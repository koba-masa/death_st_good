# frozen_string_literal: true

class CreateGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :goods do |t|
      t.string :url, null: false, comment: 'URL'
      t.integer :counter, null: false, default: 0, comment: 'いいねカウンター'

      t.timestamps
    end
  end
end
