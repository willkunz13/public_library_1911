require_relative '../lib/book'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BookTest < Minitest::Test

	def setup
		@book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
		binding.pry

	end

	def test_attributes
		assert_equal "Harper Lee", @book.author
		assert_equal "1960", @book.publication_year
		assert_equal "To Kill a Mockingbird", @book.title
	end
end
