require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do

      bookmark_1 = Bookmark.create(url: "http://makersacademy.com")
      bookmark_2 = Bookmark.create(url: "http://destroyallsoftware.com")
      bookmark_3 = Bookmark.create(url: "http://google.com")

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark if the URL is valid' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com')

      expect(Bookmark.all).to include bookmark
    end

    it 'does not create a new bookmark if the URL is invalid' do
      bookmark = Bookmark.create(url: 'not a valid URL')

      expect(Bookmark.all).not_to include bookmark
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: "http://makersacademy.com", title: 'MakersAcademy')
      current_id = bookmark.id
      Bookmark.delete(current_id)

      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)

      expect(urls).not_to include "http://makersacademy.com"
    end
  end

  describe '.edit' do
    it 'edits a bookmark' do
      bookmark = Bookmark.create(url: "http://makersacademy.com", title: 'MakersAcademy')
      current_id = bookmark.id
      Bookmark.edit(current_id, "http://makerschool.com", "MakersSchool")

      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)
      titles = bookmarks.map(&:title)

      expect(urls).not_to include "http://makersacademy.com"
      expect(titles).not_to include "MakersAcademy"
      expect(urls).to include "http://makerschool.com"
      expect(titles).to include "MakersSchool"
    end
  end

  describe '#==' do
    it 'two bookmarks are equal if their ids match' do
      bookmark_1 = Bookmark.new(1, 'http://testbookmark.com', title: 'Test Bookmark')
      bookmark_2 = Bookmark.new(1, 'http://testbookmark.com', title: 'Test Bookmark')

      expect(bookmark_1).to eq (bookmark_2)
    end
  end
end
