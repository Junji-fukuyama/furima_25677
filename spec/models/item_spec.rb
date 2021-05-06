require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    #user = FactoryBot.create(:user)
    #@item = FactoryBot.build(:item, user_id: user.id)
    @item = FactoryBot.build(:item)
    #@item.image = fixture_file_upload('/sample.png')
  end
  describe '商品出品' do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@item).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'image:必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299円以下の場合は出品出来ないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'price10000000円以上の場合は出品出来ないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが全角で入力された場合は出品できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが半角数字以外で入力された場合は出品出来ないこと' do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'category_idが空の場合は出品出来ないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが「0」を選択した場合は出品出来ないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'condition_idが空の場合は出品出来ないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idが「0」を選択した場合は出品出来ないこと' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it 'shipping_fee_status_idが空の場合は出品出来ないこと' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it 'shipping_fee_status_idが「0」を選択した場合は出品出来ないこと' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 0")
      end

      it 'prefecture_idが空の場合は出品出来ないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが「0」を選択した場合は出品出来ないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'scheduled_delivery_idが空の場合は出品出来ないこと' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it 'scheduled_delivery_idが「0」を選択した場合は出品出来ないこと' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
      end
    end
  end
end