require 'rails_helper'

feature 'Author can delete question', %q{
  In order to delete question
  As an author
  I'd like to be able to delete question
} do

  given(:user) { create(:user) }
  given(:user_not_author) { create(:user, email: '2@2.com') }
  
  given(:question) { create(:question, user: user) }

  describe 'Authenticated user' do
    scenario 'is athor of question, delete question' do
      sign_in(user)
      visit question_path(id: question)
      click_on 'Delete'
  
      expect(page).to have_content 'Your question successfully deleted'
    end
    
    scenario 'is not athor of question, tries to delete question' do
      sign_in(user_not_author)
      visit question_path(id: question)
      click_on 'Delete'
  
      expect(page).to have_content "You are not author of this question"
    end
  end

  scenario "Unauthenticated user tries to delete an question" do
    visit question_path(id: question)
    click_on 'Delete'

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
