require 'rails_helper'

# RSpec.describe UserAddress, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe User do
  describe '#create' do

    it "post,preficture,city,block,first_name,first_furigana,last_name,last_furiganaが存在すれば登録できること" do
      user = build(:user_address)
      expect(user).to be_valid
    end

    it " postがない場合は登録できないこと" do
      user = build(:user_address, post: nil)
      user.valid?
      expect(user.errors[:post]).to include("を入力してください")
    end
    it " prefictureがない場合は登録できないこと" do
      user = build(:user_address, preficture: nil)
      user.valid?
      expect(user.errors[:preficture]).to include("を入力してください")
    end
    it " cityがない場合は登録できないこと" do
      user = build(:user_address, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end
    it " blockがない場合は登録できないこと" do
      user = build(:user_address, block: nil)
      user.valid?
      expect(user.errors[:block]).to include("を入力してください")
    end


    it " first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it " first_furiganaがない場合は登録できないこと" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("を入力してください")
    end
    it " last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it " last_furiganaがない場合は登録できないこと" do
      user = build(:user, last_furigana: nil)
      user.valid?
      expect(user.errors[:last_furigana]).to include("を入力してください")
    end

    # it "emailがない場合は登録できないこと" do
    #   user = build(:user, email: nil)
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # it "passwordがない場合は登録できないこと" do
    #   user = build(:user, password: nil)
    #   user.valid?
    #   expect(user.errors[:password]).to include("can't be blank")
    # end

    # it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    # end

    # it " nicknameが7文字以上であれば登録できないこと" do
    #   user = build(:user, nickname: "aaaaaaa")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    # end

    # it "nicknameが6文字以下では登録できること " do
    #   user = build(:user, nickname: "aaaaaa")
    #   expect(user).to be_valid
    # end

    # it " 重複したemailが存在する場合は登録できないこと " do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    # it " passwordが6文字以上であれば登録できること " do
    #   user = build(:user, password: "000000", password_confirmation: "000000")
    #   expect(user).to be_valid
    # end

    # it " passwordが5文字以下であれば登録できないこと " do
    #   user = build(:user, password: "00000", password_confirmation: "00000")
    #   user.valid?
    #   expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    # end
  end
end
