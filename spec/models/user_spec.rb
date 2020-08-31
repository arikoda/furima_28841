require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,family_name,first_name,family_n_ruby,first_n_ruby,birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end
    
      it "passwordは6文字以上で登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end
 
    context 'ユーザー新規登録できない時' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "メールアドレスは＠を含んでいないと登録できない" do
        @user.email != "@"
        @user.valid?
        #expect(@user.errors.full_messages).to include("Email need to @") 
      end
    
      it "すでに登録されているメールアドレスは使えない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが5文字以下なら登録できない" do
        @user.password = "00gkd"
        @user.password_confirmation = "00gkd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "passwoedが存在しても、password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "family_n_rubyが空だと登録できない" do
        @user.family_n_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family n ruby can't be blank")
      end

      it "first_n_rubyが空だと登録できない" do
        @user.first_n_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First n ruby can't be blank")
      end

      it "family_n_rubyが全角カタカナでないと登録できない" do
        @user.family_n_ruby = ["kana"]
        @user.valid?
        expect(@user.errors[:family_n_ruby]).to include("is invalid")
      end

      it "first_n_rubyが全角カタカナでないと登録できない" do
        @user.first_n_ruby = ["kana"]
        @user.valid?
        expect(@user.errors[:first_n_ruby]).to include("is invalid")
      end

      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
