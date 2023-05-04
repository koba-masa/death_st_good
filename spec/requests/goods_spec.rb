# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Goods' do
  let(:url) { 'https://www.example.com/sample' }
  let!(:before_data) { create(:good) }

  describe 'GET /goods' do
    context 'URLが指定されている場合' do
      it '200が返却されること' do
        get '/goods', params: { url: }
        expect(response).to have_http_status(:success)
        body = response.parsed_body
        expect(body['id']).to eq before_data.id
        expect(body['url']).to eq url
        expect(body['counter']).to eq 10
      end
    end

    context 'URLが未指定の場合' do
      it '400が返却されること' do
        get '/goods', params: { url: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    context '指定したURLが存在しない場合' do
      it '404が返却されること' do
        get '/goods', params: { url: 'https://www.example.com/hoge' }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /goods' do
    let(:post_counter) { 15 }

    context 'URLが指定されている場合' do
      it '200が返却されること' do
        patch "/goods/#{before_data.id}", params: { url:, counter: post_counter }
        expect(response).to have_http_status(:success)
        body = response.parsed_body
        expect(body['id']).to eq before_data.id
        expect(body['url']).to eq url
        expect(body['counter']).to eq 25
      end
    end

    context '指定したURLが存在しない場合' do
      it '404が返却されること' do
        patch '/goods/-1', params: { url: 'https://www.example.com/hoge', counter: post_counter }
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'カウンターがマイナスの場合' do
      it '400が返却されること' do
        patch "/goods/#{before_data.id}", params: { url:, counter: -1 }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
