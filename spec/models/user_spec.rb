require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:answers).dependent(:destroy) }
    it { should have_many(:questions).dependent(:destroy) }
  end

  let(:user) { create(:user) }
  let(:user_not_athor) { create(:user, email: '2@2.com') }
  it 'athor of' do
    expect(user.author_of?(user)).to be(true)
  end

  it 'not athor of' do
    expect(user.author_of?(user_not_athor)).to be(false)
  end
end
