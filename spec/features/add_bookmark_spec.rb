feature 'Adding bookmarks' do
  scenario 'A user enters a valid URL and title' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_content 'Test Bookmark'
  end

  scenario 'A user enter an invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'This is not a valid URL')
    fill_in('title', with: 'Not Valid')
    click_button('Submit')

    expect(page).not_to have_content "Not Valid"
    expect(page).to have_content "You must enter a valid URL"
  end
end
