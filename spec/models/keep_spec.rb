require 'rails_helper'

RSpec.describe Keep, type: :model do
  subject { FactoryGirl.create :keep }
  it { expect(subject).to be_valid }
  it { expect(subject).to be_respond_to('deactive!') }
end
