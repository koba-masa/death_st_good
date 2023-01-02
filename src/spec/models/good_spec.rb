# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Good, type: :model do
  describe 'バリデーション' do
    context 'URL' do
      let(:data) { build(:good) }

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
    end

    context 'いいねカウンター' do
      let(:data_counter) { build(:good) }

      context '正の数の場合' do
        it 'trueが返却されること' do
          expect(data_counter).to be_valid
          data_counter.counter = 0
          expect(data_counter).to be_valid
        end
      end

      context '負の数の場合' do
        it 'falseが返却されること' do
          data_counter.counter = -1
          expect(data_counter).to be_invalid
        end
      end

      context '設定されていない場合' do
        it 'falseが返却されること' do
          data_counter.counter = ''
          expect(data_counter).to be_invalid
          data_counter.counter = nil
          expect(data_counter).to be_invalid
        end
      end

      context '数値でない場合' do
        it 'falseが返却されること' do
          data_counter.counter = '10'
          expect(data_counter).to be_invalid
          data_counter.counter = 'test'
          expect(data_counter).to be_invalid
        end
      end
    end
  end
end
