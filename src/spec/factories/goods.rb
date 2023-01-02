# frozen_string_literal: true

FactoryBot.define do
  factory :good, class: 'Good' do
    url { 'death_st_good.koba-masa.com' }
    counter { 10 }
  end
end
