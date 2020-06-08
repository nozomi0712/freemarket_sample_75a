require 'rails_helper'

describe Card do
  let(:user)  {create(:user)}
  context "cardが登録できること" do
    it "全て入力されると登録できること" do
      expect(create(:card)).to be_valid
    end
  end
  context "cardが登録できるない" do
    it "userがいないと登録できないこと" do
      card = build(:card, user: nil)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end
  end
end
