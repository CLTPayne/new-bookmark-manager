require 'pg'

feature 'Editing bookmarks' do
  scenario 'A user changes an entry with a valid URL and a title' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    click_button('Fabit!')
    fill_in('url', with: 'http://newtestbookmark.com')
    fill_in('title', with: 'New Test Bookmark')
    click_button('Submit')
    expect(page).to have_content 'New Test Bookmark'
  end

  scenario 'A user edits with an invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    click_button('Fabit!')

    fill_in('url', with: 'Not a valid URL')
    fill_in('title', with: 'New Test Bookmark')
    click_button('Submit')
    expect(page).not_to have_content "Not a valid URL"
    expect(page).to have_content "You must enter a valid URL"
  end
end
