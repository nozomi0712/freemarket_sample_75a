require 'rails_helper'
describe User do
  describe '#create' do
    it "nickname、email、password、password_confirmation、birthday, first_name, :first_furigana, :last_name, :last_furigana が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "first_furiganaがない場合は登録できないこと" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("を入力してください")
    end
    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "last_furiganaがない場合は登録できないこと" do
      user = build(:user, last_furigana: nil)
      user.valid?
      expect(user.errors[:last_furigana]).to include("を入力してください")
    end
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "first_nameが全角漢字以外は登録できないこと" do
      user = build(:user, first_name: "ﾎﾟｰﾙ")
      user.valid?
      expect(user.errors[:first_name]).to include("には全角漢字で入力してください。")
    end
    it "last_nameが全角漢字以外は登録できないこと" do
      user = build(:user, last_name: "ｼﾞｪｰｿﾝ")
      user.valid?
      expect(user.errors[:last_name]).to include("には全角漢字で入力してください。")
    end
    it "first_furiganaが全角以外は登録できないこと" do
      user = build(:user, first_furigana: "ﾎﾟｰﾙ")
      user.valid?
      expect(user.errors[:first_furigana]).to include("には全角で入力してください。")
    end
    it "last_furiganaが全角以外は登録できないこと" do
      user = build(:user, last_furigana: "ｼﾞｪｰｿﾝ")
      user.valid?
      expect(user.errors[:last_furigana]).to include("には全角で入力してください。")
    end
  end
end
