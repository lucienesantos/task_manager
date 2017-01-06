require 'rails_helper'

RSpec.describe Makro, type: :model do
  subject { FactoryGirl.create :makro }
  it { expect(subject).to be_valid }
  it { expect(subject).to be_respond_to('deactive!') }
  
  describe('default scope') do 
    let(:makro){ FactoryGirl.create :makro }

    before(:each){ makro.deactive! }

    it('should not included deleted records') { expect(Makro.all).to_not include(makro) }
  end

end
