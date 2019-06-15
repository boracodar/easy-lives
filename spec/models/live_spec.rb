# frozen_string_literal: true

RSpec.describe Live do
  describe '#can_be_deleted?' do
    let(:live) { create(:live) }
    let(:user) { create(:user) }

    describe 'recorded scope' do
      let!(:live_1) { create :live, episode: 42 }
      let!(:live_2) { create :live, episode: nil }

      it 'returns only recorded lives' do
        expect(described_class.recorded).to eq([live_1])
      end
    end

    describe 'non_recorded scope' do
      let!(:live_1) { create :live, episode: 42 }
      let!(:live_2) { create :live, episode: nil }

      it 'returns only recorded lives' do
        expect(described_class.non_recorded).to eq([live_2])
      end
    end

    it 'returns true for lives with no votes' do
      expect(live.can_be_deleted?).to be true
    end

    it 'returns false for lives with at least one vote' do
      Vote.create! live: live, user: user
      expect(live.can_be_deleted?).to be false
    end
  end
end
