require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('camera.png')
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'image,name,category,condition,shipping_charge,origin_area,send_day全て入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '写真が添付されていないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '状態が選択されていないと保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end
      it '状態の選択がid1の場合（未選択）の場合保存ができない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it '商品の説明がないと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリー情報が選択されていないと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーの選択がid1の場合（未選択）の場合保存ができない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '配送料負担の選択がされていないと保存できない' do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it '配送料負担の選択がid1の場合（未選択）の場合保存ができない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges must be other than 1')
      end

      it '発送元の地域についての情報が選択されていないと保存できない' do
        @item.origin_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin area can't be blank", 'Origin area is not a number')
      end
      it '配送元の選択がid1の場合（未選択）の場合保存ができない' do
        @item.origin_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Origin area must be other than 1')
      end

      it '発送日数が選択されていないと保存できない' do
        @item.send_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it '配送日数の選択がid1の場合（未選択）の場合保存ができない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day must be other than 1')
      end

      it '価格情報が入力されていないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格情報が300円以下で設定されていると保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '価格情報が10000000円以上で設定されていると保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it '販売価格が全角で入力されていると保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐づいていない商品は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
