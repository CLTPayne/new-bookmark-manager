require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    Bookmark.create(url: "http://makersacademy.com", title: 'MakersAcademy')
    Bookmark.create(url: "http://destroyallsoftware.com",title: 'Destroy')
    Bookmark.create(url: "http://google.com",title: 'Google')

    visit('/bookmarks')

    expect(page).to have_content "MakersAcademy"
    expect(page).to have_content "Destroy"
    expect(page).to have_content "Google"
  end
end
