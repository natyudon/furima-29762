require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '新規商品出品登録' do
    before do
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('public/images/test.png')
    end

    it '全ての値が存在すれば登録できること' do
      expect(@product).to be_valid
    end
    it '画像が存在しない時登録できないこと' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が存在しない時、登録できないこと' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が存在しない時、登録できないこと' do
      @product.content = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Content can't be blank")
    end
    it 'カテゴリーの情報が存在しない時、登録できないこと' do
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank", 'Category Select')
    end
    it '商品の状態についての値が存在しない時、登録できないこと' do
      @product.state_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("State can't be blank", 'State Select')
    end
    it '配送料の負担についての値が存在しない時、登録できないこと' do
      @product.delivery_fee_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee Select')
    end
    it '発送元の地域についての情報が存在しない時、登録できないこと' do
      @product.area_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Area can't be blank", 'Area Select')
    end
    it '発送までの日数についての情報が存在しない時、登録できないこと' do
      @product.delivery_day_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery day can't be blank", 'Delivery day Select')
    end
    it '価格についての情報がない時、登録できないこと' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end
    it '価格が、¥300未満の時登録できないこと' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が、¥9,999,999より大きい時、登録できないこと' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格が半角数字出ない時、登録できないこと' do
      @product.price = '１００００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end
  end
end
