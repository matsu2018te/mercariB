require 'rails_helper'

def login_user(user)
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in user
end

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

  describe 'Delete #destroy' do
    before do
      sign_in @user
    end

    it "product delete" do
      expect{
        delete :destroy, params: { id: @product.id }
      }.to change(Product, :count).by(-1)
    end
  end

  describe 'POST #completed_transaction' do
    it "renders the :completed_transaction template" do
      post :completed_transaction, params: { id: @product.id }
      expect(response).to render_template :completed_transaction
    end
  end

end

