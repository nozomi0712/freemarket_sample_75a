require 'rails_helper'

describe Item do

  describe "#create" do
    it "全ての項目が入力された場合に登録できること" do
      item = build(:item)
      expect(create(:item)).to be_valid 
    end

    it "item_nameがないと登録できないこと" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("を入力してください")
    end

    it "explanationがないと登録できないこと" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("を入力してください")
    end

    it "priceがないと登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "priceが300以下だと登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end
    
    it "priceが300以上だと登録できること" do
      expect(create(:item, price: 301)).to be_valid
    end
    
    it "brand_idがなくても登録できること" do
      expect(create(:item, brand: nil)).to be_valid
    end

    it "condition_idがないと登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "user_idがないと登録できないこと" do
      item = build(:item, user: nil)
      item.valid?
      expect(item.errors[:user]).to include("を入力してください")
    end

    it "ship_date_idがないと登録できないこと" do
      item = build(:item, ship_date: nil)
      item.valid?
      expect(item.errors[:ship_date]).to include("を入力してください")
    end

    it "delivery_fee_idがないと登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("を入力してください")
    end

    it "category_idがないと登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "imagesがないと登録できないこと" do
      item = build(:item_no_image)
      item.valid?
      expect(item.errors[:images]).to include("は1文字以上で入力してください")
    end

  end
end
