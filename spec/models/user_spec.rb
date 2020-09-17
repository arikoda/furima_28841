require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,family_name,first_name,family_n_ruby,first_n_ruby,birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordは6文字以上で登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'メールアドレスが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です")
      end

      it 'メールアドレスは＠を含んでいないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'すでに登録されているメールアドレスは使えない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが5文字以下なら登録できない' do
        @user.password = '00gkd'
        @user.password_confirmation = '00gkd'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwoedが存在しても、password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（姓）を入力してください", "お名前（姓）は全角で入力してください")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）を入力してください", "お名前（名）は全角で入力してください")
      end

      it 'family_n_rubyが空だと登録できない' do
        @user.family_n_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（姓）を入力してください")
      end

      it 'first_n_rubyが空だと登録できない' do
        @user.first_n_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名）を入力してください")
      end

      it 'family_n_rubyが全角カタカナでないと登録できない' do
        @user.family_n_ruby = ['kana']
        @user.valid?
        expect(@user.errors[:family_n_ruby]).to include('フリガナ（姓）は全角カタカナで入力してください')
      end

      it 'first_n_rubyが全角カタカナでないと登録できない' do
        @user.first_n_ruby = ['kana']
        @user.valid?
        expect(@user.errors[:first_n_ruby]).to include('フリガナ（名）は全角カタカナで入力してください')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
