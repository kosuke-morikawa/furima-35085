require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end 
  describe '商品出品機能' do
    context '出品ができる時' do
      it '全ての情報が正しく入力されていれば、出品できること' do
        expect(@product).to be_valid
      end
    end
  end
  
  context '出品ができない時' do
    it '商品画像が必須であること' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "Image can't be blank"
    end

    it '商品名が必須であること' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it '商品の説明が必須であること' do
      @product.info = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Info can't be blank"
    end

    it 'カテゴリーが必須であること' do
      @product.category_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Category is not a number"
    end

    it '商品の状態が必須であること' do
      @product.sales_status_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Sales status is not a number"
    end

    it '配送料の負担が必須であること' do
      @product.shipping_fee_status_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Shipping fee status is not a number"
    end

    it '発送元の地域が必須であること' do
      @product.prefecture_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Prefecture is not a number"
    end

    it '発送までの日数が必須であること' do
      @product.scheduled_delivery_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Scheduled delivery is not a number"
    end

    it '販売価格が必須であること' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it '販売価格が300円より上であること' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include 'Price is invalid'
    end

    it '販売価格が10000000円以下であること' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include 'Price is invalid'
    end

    it '販売価格が半角数字であること' do
      @product.price = '１０００'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Price is invalid'
    end

    it '全角文字では登録できないこと' do
      @product.price = 'アイウエオ'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Price is invalid'
    end

    it '半角英数混合では登録できないこと' do
      @product.price = '123abc'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Price is invalid'
    end

    it '半角英語だけでは登録できないこと' do
      @product.price = 'aiueo'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Price is invalid'
    end

    it "商品の状態で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @product.sales_status_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Sales status must be other than 1'
    end

    it "配送料の負担で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @product.shipping_fee_status_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Shipping fee status must be other than 1'
    end

    it "発送元の地域で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @product.prefecture_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Prefecture must be other than 1'
    end

    it "発送までの日数で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @product.scheduled_delivery_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Scheduled delivery must be other than 1'
    end

    it "カテゴリーで{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include 'Category must be other than 1'
    end
  end
end