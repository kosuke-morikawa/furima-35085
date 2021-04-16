require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'last-nameが空では登録できない' do
    end
    it 'first-nameが空では登録できない' do
    end
    it 'last-name-kanaが空では登録できない' do
    end
    it 'first-name-kanaが空では登録できない' do
    end
    it 'birth-dateが空では登録できない' do
    end
    it 'passwordは５文字以下では登録できない' do
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    end
end