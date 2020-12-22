require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwordとpassword_confirmation,family_name,first_name,family_name_kana,first_name_kana,birth_dayが存在すれば登録できる" do
        # expect(@user).to be_valid
        expect(@user.valid?).to eq true
      end
    end
    context '新規登録がうまくいかないとき' do
    it "nameが空だと登録できない" do
      @user.name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@が含まれていない" do
      @user.email = 'testemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordがパスワードが6文字以上でないと登録できない" do
      @user.password = 'aaa'
      @user.password_confirmation = 'aaa'
      @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'password:半角英数混合(半角英語のみ)でないと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password = 'aaaa111'
      @user.password_confirmation = 'bbbb111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "family_nameが全角ひらがな・カタカナ・漢字でなければ保存できない" do
      @user.family_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが全角ひらがな・カタカナ・漢字でなければ保存できない" do
      @user.first_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "family_name_kanaが全角カタカナのみでなければ保存できない" do
      @user.family_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが全角カタカナのみでなければ保存できない" do
      @user.first_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "birth_dayが空では登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "family_nameが半角英語だと保存できない" do
      @user.family_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが半角英語だと保存できない" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
  end
end
end