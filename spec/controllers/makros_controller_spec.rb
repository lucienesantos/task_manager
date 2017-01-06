require 'rails_helper'

RSpec.describe MakrosController, type: :controller do

  let(:valid_attributes) { {name: "My new Makro"} }
  let(:invalid_attributes) { {name: ""} }
  
  describe "GET #index" do
    let!(:makro_clean_house){ FactoryGirl.create(:makro, name: 'Clean House') }
    let!(:makro_get_things_done){ FactoryGirl.create(:makro, name: 'Get things done') }

    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns all makros as json" do
      get :index, format: :json
      json = JSON.parse(response.body)
      expect(json.count).to eq(2)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Makro" do
        expect {
          post :create, params: {makro: valid_attributes}, format: :json
        }.to change(Makro, :count).by(1)
      end

      it "assigns a newly created makro as @makro" do
        post :create, params: {makro: valid_attributes}, format: :json
        expect(assigns(:makro)).to be_a(Makro)
        expect(assigns(:makro)).to be_persisted
      end

      it "renders a a makro as json" do
        post :create, params: {makro: valid_attributes}, format: :json
        json = JSON.parse(response.body)
        expect(json["name"]).to eq("My new Makro")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved makro as @makro" do
        post :create, params: {makro: invalid_attributes}, format: :json
        expect(assigns(:makro)).to be_a_new(Makro)
        expect(assigns(:makro)).not_to be_persisted
      end
    end
  end

  describe "GET #show" do
    let(:makro){ FactoryGirl.create :makro }
    
    it "returns http success" do
      get :show, params: { id: makro.id }
      expect(response).to have_http_status(:success)
    end
  end

end
