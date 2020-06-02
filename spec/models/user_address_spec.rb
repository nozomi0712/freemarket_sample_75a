require 'rails_helper'
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
  end
end
