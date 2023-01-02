# frozen_string_literal: true

class Good < ApplicationRecord
  attr_accessor :url, :counter

  validates :url, presence: true
  # TODO: バリデーションが通らない。なんで？
  #validates :counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :counter_be_valid?

  def counter_be_valid?
    return if counter.present? && !counter.is_a?(String) && counter >= 0
    errors.add(:counter, 'must be greater than or equal to 0')
  end
end
