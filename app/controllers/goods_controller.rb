# frozen_string_literal: true

class GoodsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_handler

  def index
    url = params[:url]
    if url.blank?
      render json: {}, status: :bad_request
      return
    end

    @good = Good.find_by(url:)
    return if @good.present?

    render json: {}, status: :not_found
    nil
  end

  def update
    @good = Good.find(params[:id])
    if params[:counter].blank? || params[:counter] =~ /^-\d+/
      render json: {}, status: :bad_request
      return
    end
    counter = params[:counter].to_i
    @good.increment(:counter, counter)
    @good.save
  end

  private

  def not_found_handler
    render json: {}, status: :not_found
  end
end
