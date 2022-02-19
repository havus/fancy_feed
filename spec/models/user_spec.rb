require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:display_name) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:display_name) }
  end

  describe 'associations' do
    it { should have_many :subscribers }
    it { should have_many :subscriptions }

    scenario 'andi subscribe barry' do
      andi  = create(:user, username: 'Andi')
      barry = create(:user, username: 'Barry')

      andi.subscribe(barry)

      expect(andi.subscriptions).to include barry
      expect(andi.subscribers).to   be_blank

      expect(barry.subscriptions).to be_blank
      expect(barry.subscribers).to   include andi
    end
  end
end
