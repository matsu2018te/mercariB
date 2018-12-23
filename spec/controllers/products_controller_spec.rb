require 'rails_helper'

describe ProductsController do

  before do
    @user = create(:user)
    @product = create(:product, seller_id: @user.id)
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: { id: @product.id }
      expect(response).to render_template :show
    end

  it "assigns the requested product to @product" do
    get :show, params: { id: @product.id }
    expect(assigns(:product)).to eq @product
  end

  end
end
