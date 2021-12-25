require 'rails_helper'

feature 'User can create answer', %q{
  In order to get answer on question from a community
  As an user
  I'd like to be able to create answer
} do
  
  given(:question) { create(:question) }

  background do    
    visit question_path(id: question)
  end

  scenario 'create answer' do
    fill_in 'Body', with: 'answer_text'
    click_on 'Create'

    expect(page).to have_content 'Your answer successfully created'
    expect(page).to have_content 'answer_text'
  end
  
  scenario 'create answer with errors' do
    click_on 'Create'

    expect(page).to have_content "Body can't be blank"
  end
end