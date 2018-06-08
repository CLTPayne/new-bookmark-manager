require 'pg'

feature 'Deleting bookmarks' do
  scenario "A user can delete a bookmark" do
    bookmark = Bookmark.create(url: "http://makersacademy.com", title: 'MakersAcademy')
    Bookmark.create(url: "http://destroyallsoftware.com",title: 'Destroy')
    Bookmark.create(url: "http://google.com",title: 'Google')

    visit('/bookmarks')

    within "#bookmark-#{bookmark.id}" do
      click_button 'Smash!'
    end

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_content 'MakersAcademy'
    expect(page).to have_content 'Destroy'
    expect(page).to have_content 'Google'

  end
end
