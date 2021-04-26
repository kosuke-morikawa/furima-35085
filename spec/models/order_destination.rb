require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user, email: 'test2@example')
    @order_destination = FactoryBot.build(:order_destination, product_id: @product.id, user_id: @user.id)
    sleep(1)
  end
  describe '商品購入機能' do
    context '購入ができる時' do
      it '全ての情報が正しく入力されていれば、購入できること' do
        expect(@order_destination).to be_valid
      end

      it '建物名が空の場合でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end
  end

  context '購入ができない時' do
    it 'user_idが必須であること' do
      @order_destination.user_id = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "User can't be blank"
    end

    it 'product_idが必須であること' do
      @order_destination.product_id = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "Product can't be blank"
    end

    it '郵便番号が必須であること' do
      @order_destination.postal_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "Postal code can't be blank"
    end

    it '都道府県が必須であること' do
      @order_destination.prefecture_id = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "Prefecture can't be blank"
    end

    it '市区町村が必須であること' do
      @order_destination.city = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "City can't be blank"
    end

    it '番地が必須であること' do
      @order_destination.addresses = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "Addresses can't be blank"
    end

    it '電話番号が必須であること' do
      @order_destination.phone_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "Phone number can't be blank"
    end

    it 'tokenが必須であること' do
      @order_destination.token = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include "Token can't be blank"
    end

    it '郵便番号にハイフンがなければ登録できないこと' do
      @order_destination.postal_code = '0000000'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include 'Postal code is invalid'
    end

    it '電話番号が11桁以内の数値のみであること' do
      @order_destination.phone_number = '000000000000'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include 'Phone number is invalid'
    end

    it '電話番号は英数混合では登録できないこと' do
      @order_destination.phone_number = '0000000000a'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include 'Phone number is invalid'
    end

    it "都道府県で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include 'Prefecture must be other than 1'
    end
  end
end
