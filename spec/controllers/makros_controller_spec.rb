require 'rails_helper'

RSpec.describe MakrosController, type: :controller do

  describe "GET #show" do
    let(:makro){ FactoryGirl.create :makro }
    
    it "returns http success" do
      get :show, params: { id: makro.id }
      expect(response).to have_http_status(:success)
    end
  end

end
