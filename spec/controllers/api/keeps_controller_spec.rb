require 'rails_helper'

RSpec.describe Api::KeepsController, type: :controller do

  let(:valid_attributes) { { title: 'Get a Rest' } }

  describe "GET #index" do
    let(:just_a_task){ FactoryGirl.create(:keep) }
    let(:deleted_task){ FactoryGirl.create(:keep, title: 'Born & Burn', deleted: true, deleted_at: Time.now) }
    let(:started_task){ FactoryGirl.create(:keep, title: 'Take a Rest', started: true, started_at: Time.now) }
    let(:completed_task){ FactoryGirl.create(:keep, title: 'Mr. Robot', completed: true, completed_at: Time.now) }

    it "when scope is 'current' should assigns keeps started as @keeps" do
      get :index, params: { scope: 'current' }, format: :json
      expect(assigns(:keeps)).to include(started_task)
      expect(assigns(:keeps)).to_not include(deleted_task)
      expect(assigns(:keeps)).to_not include(completed_task)
    end

    it "when scope is 'done' should not include" do
      get :index, params: { scope: 'done' }, format: :json
      expect(assigns(:keeps)).to include(completed_task)
      expect(assigns(:keeps)).to_not include(deleted_task)
      expect(assigns(:keeps)).to_not include(started_task)
    end

    it "when scope is 'current' should assigns keeps started as @keeps" do
      get :index, params: { scope: 'todo' }, format: :json
      expect(assigns(:keeps)).to include(just_a_task)
      expect(assigns(:keeps)).to_not include(started_task)
      expect(assigns(:keeps)).to_not include(completed_task)
      expect(assigns(:keeps)).to_not include(deleted_task)
    end
  end

end
