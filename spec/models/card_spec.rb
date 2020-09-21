require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'クレジットカード登録機能' do
    before do
      @card = FactoryBot.build(:card)
    end

    it '全ての値が存在する時登録できること' do
      expect(@card).to be_valid
    end

    it 'card_tokenが存在しない時、登録できないこと' do
      @card.card_token = nil
      @card.valid?
      expect(@card.errors.full_messages).to include("Card tokenを入力してください")
    end

    it 'customer_tokenが存在しない時、登録できないこと' do
      @card.customer_token = nil
      @card.valid?
      expect(@card.errors.full_messages).to include("Customer tokenを入力してください")
    end
  end
end
