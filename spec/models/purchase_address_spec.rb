require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context 'ユーザーが商品を購入できる場合' do
      it '情報が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'ユーザーIDとアイテムIDが紐付いていれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ' '
        expect(@purchase_address).to be_valid
      end
    end


    context 'ユーザーが商品を購入できない場合' do
      it 'postal_numberが空では購入できない' do
        @purchase_address.postal_number = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal number can't be blank"
      end

      it 'postal_numberにハイフン(-)が含まれていないと購入できない' do
        @purchase_address.postal_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal number is invalid. Include hyphen(-)"
      end

      it 'prefecture_idが空では購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'municipalitiesが空では購入できない' do
        @purchase_address.municipalities = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it 'addressが空では購入できない' do
        @purchase_address.address = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'telephone_numberが空では購入できない' do
        @purchase_address.telephone_number = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number can't be blank"
      end

      it 'telephone_numberが10桁以上、11桁以内でないと購入できない(10桁未満の場合)' do
        @purchase_address.telephone_number = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberが10桁以上、11桁以内でないと購入できない(11桁以上の場合)' do
        @purchase_address.telephone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberが半角数値でないと購入できない(全角数字の場合)' do
        @purchase_address.telephone_number = '１２３４５６７８９１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberが半角数値でないと購入できない(数字以外の半角文字の場合)' do
        @purchase_address.telephone_number = 'ｱｲｳｴｵaiueo'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberが半角数値でないと購入できない(数字以外の全角文字の場合)' do
        @purchase_address.telephone_number = 'アイウエオかきくけこ青間'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'user_idが紐付いてないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが紐付いてないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
