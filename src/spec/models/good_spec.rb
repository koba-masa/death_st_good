# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Good do
  describe 'バリデーション' do
    let(:data) { build(:good) }

    context 'URL' do
      context '設定されている場合' do
        it 'trueが返却されること' do
          expect(data).to be_valid
        end
      end

      context '設定されていない場合' do
        it 'falseが返却されること' do
          data.url = nil
          expect(data).to be_invalid
          data.url = ''
          expect(data).to be_invalid
        end
      end

      context 'すでに登録されている場合' do
        before { create(:good) }

        it 'falseが返却されること' do
          expect(data).to be_invalid
        end
      end
    end

    context 'いいねカウンター' do
      context '正の数の場合' do
        it 'trueが返却されること' do
          expect(data).to be_valid
          data.counter = 0
          expect(data).to be_valid
        end
      end

      context '負の数の場合' do
        it 'falseが返却されること' do
          data.counter = -1
          expect(data).to be_invalid
        end
      end

      context '設定されていない場合' do
        it 'falseが返却されること' do
          data.counter = ''
          expect(data).to be_invalid
          data.counter = nil
          expect(data).to be_invalid
        end
      end

      context '数値でない場合' do
        it 'falseが返却されること' do
          data.counter = 'test'
          expect(data).to be_invalid
        end
      end
    end
  end
end
