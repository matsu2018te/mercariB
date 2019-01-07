require 'rails_helper'

describe "UserFeature" do
  before do
    @user     = create(:user)
    @product  = create(:product)
    @image    = create(:image)
    @params = Hash.new
    @params[:q] = Hash.new
  end

  describe 'GET #search' do
    it "renders the :search template" do
      @params[:q][:info_or_name_or_brand_name_or_category_name_cont_all] = @product.name
      post "/search", @params
      expect(response).to render_template :search
    end

    it "keyword search" do
      @params[:q][:info_or_name_or_brand_name_or_category_name_cont_all] = @product.name
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "category search" do
      @params[:q][:category_id_in] = @product.category_id
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "brand search" do
      @params[:q][:brand_name_cont_all] = @product.brand.name
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "size search" do
      @params[:q][:size_id_in] = @product.size_id
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "price search" do
      @params[:q][:price_gteq] = 100
      @params[:q][:price_lteq] = 600
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "status search" do
      @params[:q][:status_eq_any] = @product.size_id
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "delivery_fee_owner search" do
      @params[:q][:delivery_fee_owner_eq_any] = @product.delivery_fee_owner
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "delivery_fee_owner search" do
      @params[:q][:buyer_id_not_null] = @product.buyer_id
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end

    it "sold_out search" do
      @params[:q][:buyer_id_not_null] = @product.buyer_id
      post "/search", @params
      expect(assigns(:product)).to eq @product_result
    end
  end
end
