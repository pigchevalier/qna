require 'rails_helper'

feature 'User can sign out', %q{
  In order quit 
  As an authenticated user
  I'd like to be able to sign out
} do

  given(:user) { create(:user) }

  background do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  scenario 'Authenticated user tries to sign out' do
    click_on 'Log out'

    expect(page).to have_content 'Questions'
  end
end