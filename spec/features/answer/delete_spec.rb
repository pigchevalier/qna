require 'rails_helper'

feature 'Author can delete answer', %q{
  In order to delete answer on question from a community
  As an author
  I'd like to be able to delete answer
} do

  given(:user) { create(:user) }
  given(:user_not_author) { create(:user, email: '2@2.com') }
  
  given(:question) { create(:question, user: user) }

  given(:answer) { create(:answer, question: question, user: user) }

  describe 'Authenticated user' do
    scenario 'is athor of answer, delete answer' do
      sign_in(user)          
      visit answer_path(id: answer)
      click_on 'Delete'
  
      expect(page).to have_content 'Your answer successfully deleted'
    end
    
    scenario 'is not athor of answer, tries to delete answer' do
      sign_in(user_not_author)          
      visit answer_path(id: answer)
      click_on 'Delete'
  
      expect(page).to have_content "You are not author of this answer"
    end
  end

  scenario "Unauthenticated user tries to delete an answer" do
    visit answer_path(id: answer)
    click_on 'Delete'

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
