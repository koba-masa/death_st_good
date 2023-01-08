# frozen_string_literal: true

Rails.application.routes.draw do
  resources :goods, only: %i[index update], format: 'json'
end
