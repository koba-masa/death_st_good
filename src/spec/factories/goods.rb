# frozen_string_literal: true

FactoryBot.define do
  factory :good, class: 'Good' do
    url { 'https://www.example.com/sample' }
    counter { 10 }
  end
end
