require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryGirl.build(:user) }

  context 'when has name' do
    it 'is valid' do
      expect(user.valid?).to be_truthy
    end
  end

  context 'when does not has name' do
    before do
      user.name = nil
    end

    it 'is not valid' do
      expect(user.valid?).to be_falsy
    end
  end
end
