require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録機能' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'name,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it 'emailが重複していた時登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'emailが「@」を含んでいない時登録できないこと' do
      @user.email = 'sukusukugmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'passwordが空の時登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'passwordが5文字以下の時登録できないこと' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordは半角英数字混合出ない時登録できないこと' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'passwordが存在しても、password_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'first_nameが空の時、登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を入力してください', '名字は全角で入力してください。')
    end
    it 'first_nameが全角でない時、登録できないこと' do
      @user.first_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は全角で入力してください。')
    end
    it 'last_nameが空のとき、登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください', '名前は全角で入力してください。')
    end

    it 'last_nameが全角でない時、登録できないこと' do
      @user.last_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は全角で入力してください。')
    end
    it 'first_name_kanaが空の時、登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名字のフリガナを入力してください', '名字のフリガナは全角カタカナで入力して下さい。')
    end
    it 'first_name_kanaが全角カタカナでない時、登録できないこと' do
      @user.first_name_kana = 'しゅんすけ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字のフリガナは全角カタカナで入力して下さい。')
    end
    it 'last_name_kanaが空のとき、登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名前のフリガナを入力してください', '名前のフリガナは全角カタカナで入力して下さい。')
    end

    it 'last_name_kanaが全角カタカナでない時、登録できないこと' do
      @user.last_name_kana = 'しゅんすけ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前のフリガナは全角カタカナで入力して下さい。')
    end
    it 'birth_dateが空の時、登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
