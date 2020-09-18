require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入管理機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'tokenが存在しない時、保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it 'postal_codeが存在しない時、保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", '郵便番号は不正な値です')
    end
    it 'postal_codeに全角数字が含まれている時、保存できないこと' do
      @order_address.postal_code = '４４４-０１２２'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
    end
    it 'postal_codeに「-」が含まれていない時、保存できないこと' do
      @order_address.postal_code = 4_440_122
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
    end
    it 'prefecture_idが存在しない時、保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
    end
    it 'prefecture_idが１の時、保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
    end
    it 'municipalitieが存在しない時、保存できないこと' do
      @order_address.municipalitie = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市区町村を入力してください", '市区町村は全角で入力してください。')
    end
    it 'municipalitieが全角出ない時、保存できないこと' do
      @order_address.municipalitie = 'abcdef'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('市区町村は全角で入力してください。')
    end
    it 'addressが存在しない時、保存できないこと' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_numberが存在しない時、保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください", '電話番号は不正な値です')
    end
    it 'phone_numberが12桁以上ある時、保存できないこと' do
      @order_address.phone_number = '090090909090'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end
  end
end
