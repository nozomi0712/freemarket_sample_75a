require 'rails_helper'

RSpec.describe "Items", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/items/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/items/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/items/delete"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /purchase" do
    it "returns http success" do
      get "/items/purchase"
      expect(response).to have_http_status(:success)
    end
  end

end
