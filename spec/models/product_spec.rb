require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '新規商品出品登録' do
    before do
      @product = FactoryBot.build(:product)
      @product.images = [fixture_file_upload('public/images/test.png')]
    end

    it '全ての値が存在すれば登録できること' do
      expect(@product).to be_valid
    end
    it '画像が複数存在しても保存できること' do
      @product.images = [fixture_file_upload('public/images/test.png'), fixture_file_upload('public/images/test2.png'), fixture_file_upload('public/images/test3.png')]
      expect(@product).to be_valid
    end
    it '画像が存在しない時登録できないこと' do
      @product.images = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('画像を入力してください')
    end
    it '商品名が存在しない時、登録できないこと' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('商品名を入力してください')
    end
    it '商品説明が存在しない時、登録できないこと' do
      @product.content = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'カテゴリーの情報が存在しない時、登録できないこと' do
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it '商品の状態についての値が存在しない時、登録できないこと' do
      @product.state_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('商品の状態を選択してください')
    end
    it '配送料の負担についての値が存在しない時、登録できないこと' do
      @product.delivery_fee_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('配送料の負担を選択してください')
    end
    it '発送元の地域についての情報が存在しない時、登録できないこと' do
      @product.area_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it '発送までの日数についての情報が存在しない時、登録できないこと' do
      @product.delivery_day_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('発送までの日数を選択してください')
    end
    it '価格についての情報がない時、登録できないこと' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('価格を入力してください')
    end
    it '価格が、¥300未満の時登録できないこと' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it '価格が、¥9,999,999より大きい時、登録できないこと' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
    it '価格が半角数字出ない時、登録できないこと' do
      @product.price = '１００００'
      @product.valid?
      expect(@product.errors.full_messages).to include('価格は数値で入力してください')
    end
    it 'category_idの値が1の時、登録できないこと' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it 'state_idの値が1の時、登録できないこと' do
      @product.state_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('商品の状態を選択してください')
    end
    it 'delivery_fee_idの値が1の時、登録できないこと' do
      @product.delivery_fee_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('配送料の負担を選択してください')
    end
    it 'area_idの値が1の時、登録できないこと' do
      @product.area_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it 'delivery_day_idの値が1の時、登録できないこと' do
      @product.delivery_day_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('発送までの日数を選択してください')
    end
  end
end
