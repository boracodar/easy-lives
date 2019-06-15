# frozen_string_literal: true

RSpec.describe LiveDecorator do
  subject(:live_decorator) { build(:live, episode: episode).decorate }

  describe '#formatted_episode' do
    context 'when episode has only one char' do
      let(:episode) { 1 }

      it 'returns the episode as a string with 3 chars' do
        expect(live_decorator.formatted_episode).to eq('#001')
      end
    end

    context 'when episode has only two chars' do
      let(:episode) { 42 }

      it 'returns the episode as a string with 3 chars' do
        expect(live_decorator.formatted_episode).to eq('#042')
      end
    end

    context 'when episode has three chars' do
      let(:episode) { 123 }

      it 'returns the episode as a string with 3 chars' do
        expect(live_decorator.formatted_episode).to eq('#123')
      end
    end

    context 'when episode has more than three chars' do
      let(:episode) { 1234 }

      it 'returns the episode as a string with 3 chars' do
        expect(live_decorator.formatted_episode).to eq('#1234')
      end
    end
  end
end
