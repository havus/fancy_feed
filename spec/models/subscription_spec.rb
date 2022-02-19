# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it { should belong_to :from_user }
    it { should belong_to :for_user }
  end

  describe 'attributes' do
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end
end
