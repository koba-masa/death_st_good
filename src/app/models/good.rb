# frozen_string_literal: true

class Good < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
