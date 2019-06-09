# frozen_string_literal: true

RSpec.describe Live do
  describe '#can_be_deleted?' do
    let(:live) { create(:live) }
    let(:user) { create(:user) }

    it 'returns true for lives with no votes' do
      expect(live.can_be_deleted?).to be true
    end

    it 'returns false for lives with at least one vote' do
      Vote.create! live: live, user: user
      expect(live.can_be_deleted?).to be false
    end
  end
end
