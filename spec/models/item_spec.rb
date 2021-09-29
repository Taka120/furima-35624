require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context 'ユーザーが商品を出品できる場合' do
     it '全ての項目が正しく入力されれば出品できる' do
       expect(@item).to be_valid
     end
    end

    context 'ユーザーが商品を出品できない場合' do
     it 'item_nameが空では出品できない' do
       @item.item_name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Item name can't be blank"
     end

     it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
     end
   
     it 'category_idが空では出品できない' do
       @item.category_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Category can't be blank"
     end
  
     it 'status_idが空では出品できない' do
       @item.status_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Status can't be blank"
     end

     it 'delivery_fee_idが空では出品できない' do
       @item.delivery_fee_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
     end

     it 'area_idが空では出品できない' do
       @item.area_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Area can't be blank"
     end

     it 'days_to_ship_idが空では出品できない' do
       @item.days_to_ship_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Days to ship can't be blank"
     end

     it 'item_priceが空では出品できない' do
       @item.item_price = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Item price is invalid"
     end

     it 'item_priceが半角数字でないと出品できない(全角文字の場合)' do
       @item.item_price = 'アイウエオ'
       @item.valid?
       expect(@item.errors.full_messages).to include "Item price is not a number"
     end

     it 'item_priceが半角数字でないと出品できない(半角文字の場合)' do
       @item.item_price = 'ｱｲｳｴｵ'
       @item.valid?
       expect(@item.errors.full_messages).to include "Item price is not a number"
     end

     it 'item_priceが半角数字でないと出品できない(全角数字の場合)' do
       @item.item_price = '１２３４'
       @item.valid?
       expect(@item.errors.full_messages).to include "Item price is not a number"
     end

     it 'item_priceが¥300~¥9,999,999の間でないと出品できない(低すぎる場合)' do
       @item.item_price = '10'
       @item.valid?
       expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
     end

     it 'item_priceが¥300~¥9,999,999の間でないと出品できない(高すぎる場合)' do
       @item.item_price = '10000000'
       @item.valid?
       expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
     end

     it 'imageが空では出品できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Image can't be blank"
     end
    end
  end
end
