RSpec.describe 'Sign in page', type: :system do
  context 'when accessing the initial page' do
    before { visit '/' }

    it 'redirects user to sign in page' do
      expect(page).to have_current_path('/users/sign_in')
    end
  end
end
