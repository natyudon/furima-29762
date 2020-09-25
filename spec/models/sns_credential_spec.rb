require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe 'snsアカウント登録機能'do
    before do
      @sns_credential = FactoryBot.build(:sns_credential)
    end

    it '正しい値が存在していれば保存することができる'do
      expect(@sns_credential).to be_valid
    end

    it 'providerの値が存在していなければ保存することができない' do
      @sns_credential.provider = nil
      @sns_credential.valid?
      expect(@sns_credential.errors.full_messages).to include("Providerを入力してください")
    end

    it 'uidの値が存在していなければ保存することができない' do
      @sns_credential.uid = nil
      @sns_credential.valid?
      expect(@sns_credential.errors.full_messages).to include("Uidを入力してください")
    end
  end
end
