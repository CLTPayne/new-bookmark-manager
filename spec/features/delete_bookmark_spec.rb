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

    path = "/bookmarks/#{bookmark.id}"
    expect(current_path).to eq path
    expect(page).not_to have_content 'MakersAcademy'

  end
end
