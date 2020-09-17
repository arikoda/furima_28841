require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('camera.png')
    @item.save
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: user.id)
    sleep(1)
  end

  describe '商品出品機能' do
    context '商品が購入できるとき' do
      it 'postal_code,origin_area_id,prefecture,telephoneが入力されていれば出品できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '購入者の郵便番号がないと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号が正しくありません。ハイフン（−）を入れてください")
      end

      it '購入者の都道府県が選択がid1の場合（未選択の場合）購入できない' do
        @order_address.origin_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県が選択されていません")
      end

      it '購入者の住所（市町村）が入力されていないと購入できない' do
        @order_address.prefecture = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it '購入者の住所の番地が入力されていないと購入できない' do
        @order_address.home_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @order_address.postal_code = '1123455'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号が正しくありません。ハイフン（−）を入れてください')
      end

      it '電話番号が入力されていないと購入できない' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は10文字以上で入力してください")
      end

      it '電話番号は11桁以内でないと登録できない' do
        @order_address.telephone = 123_456
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10文字以上で入力してください')
      end
      it 'tokenがないと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end
