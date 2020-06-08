require 'rails_helper'

describe Trade do
  let(:buyer)   {create(:user)}
  let(:seller)  {create(:user)}
  let(:item)    {create(:item)} 
  context "登録できる場合" do
    it "全ての項目が入力された場合に登録できること" do
      expect(create(:trade, buyer: buyer, seller_id: seller.id,item: item)).to be_valid
    end
  end

  context "登録できない場合" do
    it "itemが存在しない場合は登録できないこと" do
      trade = build(:trade, buyer: buyer, seller_id: seller.id)
      trade.valid?
      expect(trade.errors[:item]).to include("を入力してください")
    end

    it "buyerがいない場合は登録できないこと" do
      trade = build(:trade, seller_id: seller.id, item: item)
      trade.valid?
      expect(trade.errors[:buyer]).to include("を入力してください")
    end

    it "seller_idが無い場合は登録できないこと" do
      trade = build(:trade, buyer: buyer, item: item)
      trade.valid?
      expect(trade.errors[:seller_id]).to include("を入力してください")
    end
  end
end
