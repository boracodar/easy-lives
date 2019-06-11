# frozen_string_literal: true

RSpec.describe UserDecorator do
  subject(:user_decorator) { build(:user).decorate }

  describe '#avatar_url' do
    let(:hash) { Digest::MD5.hexdigest(user_decorator.email) }

    it 'returns user avatar URL' do
      expect(user_decorator.avatar_url)
        .to eq("https://www.gravatar.com/avatar/#{hash}?s=60")
    end
  end
end