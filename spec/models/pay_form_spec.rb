require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:pay_form, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end
  
  describe '商品購入' do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@order).to be_valid
      end
      it '建物情報が空の場合でも保存ができる' do
        @order.building =''
        expect(@order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空では登録出来ないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに「-」が入力されていない場合は購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeに半角英字が入力された場合は購入出来ないこと' do
        @order.postal_code = '123-abcd'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefectureが空では登録出来ないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureが「0」を選択した場合は購入出来ないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'cityが空では登録出来ないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空では登録出来ないこと' do
        @order.addresses = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空では登録出来ないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上入力された場合は購入出来ないこと' do
        @order.phone_number = '012345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberが半角数字以外の文字が入力された場合は購入出来ないこと' do
        @order.phone_number = '012345abcde'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空では購入出来ないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入出来ないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入出来ないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end