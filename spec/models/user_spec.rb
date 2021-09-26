require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できる場合' do
     it '全ての項目が正しく入力されれば登録できる' do
       @user.nickname ='太朗'
       @user.email = 'taro@test.com'
       @user.password ='t12345'
       @user.password_confirmation = @user.password
       @user.last_name = '山田'
       @user.first_name = '太朗'
       @user.last_name_reading = 'ヤマダ'
       @user.first_name_reading = 'タロウ'
       @user.birthday = '1990-01-01'
       expect(@user).to be_valid
     end
    end

    context 'ユーザーが新規登録できない場合' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end

     it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
     end
   
     it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
     end
  
     it 'emailに@が含まれていないと登録できない' do
      @user.email = 'taroutest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
     end

     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
     end

     it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end

     it 'passwordが半角英数混合していないと登録できない(数字のみの場合)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end

     it 'passwordが半角英数混合していないと登録できない(英字のみの場合)' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end

     it 'passwordとpassword_password_confirmationが一致していないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

     it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
     end

     it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
     end


     it 'last_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
      @user.last_name = 'yamada'
      @user.last_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
     end

     it 'first_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
      @user.last_name = 'ﾀﾛｳ'
      @user.last_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
     end


     it 'last_name_readingが空だと登録できない' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name reading can't be blank"
     end

     it 'first_name_readingが空だと登録できない'do
     @user.first_name_reading = ''
     @user.valid?
     expect(@user.errors.full_messages).to include "First name reading can't be blank"
     end

     it 'last_name_readingが全角(カタカナ)でないと登録できない' do
      @user.last_name_reading = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name reading is invalid"
     end

     it 'first_name_readingが全角(カタカナ)でないと登録できない' do
      @user.first_name_reading = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name reading is invalid"
     end

     it 'berthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end

     it '全角文字を含むパスワードでは登録できない' do 
      @user.password = '1234tた'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
     end
    end
  end
end
