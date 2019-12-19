require_relative '../lib/book'
require_relative '../lib/author'
require_relative '../lib/library'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class LibraryTest < Minitest::Test

	def setup
		@dpl = Library.new("Denver Public Library")
		@charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
		@charlotte_bronte.write("Jane Eyre", "October 16, 1847")
		@professor = @charlotte_bronte.write("The Professor", "1857")
		@villette = @charlotte_bronte.write("Villette", "1853")
		@harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
		@mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
	end

	def test_it_exists
		assert_instance_of Library, @dpl
	end

	def test_its_attributes
		assert_equal "Denver Public Library", @dpl.name
		assert_equal [], @dpl.books
		assert_equal [], @dpl.authors
	end

	def test_add_author
		@dpl.add_author(@charlotte_bronte)
		@dpl.add_author(@harper_lee)
		assert_includes @dpl.authors, @charlotte_bronte
		assert_includes @dpl.authors, @harper_lee
	end

	def test_publication_time_frame_for
		assert_equal "1847", @dpl.publication_time_frame_for(@charlotte_bronte)[:start]
		assert_equal "1857", @dpl.publication_time_frame_for(@charlotte_bronte)[:end]
		assert_equal "1960", @dpl.publication_time_frame_for(@harper_lee)[:start]
		assert_equal "1960", @dpl.publication_time_frame_for(@harper_lee)[:end]
	end	

	def test_checkout
		assert_equal false, @dpl.checkout(@jane_eyre)
		assert_equal false, @dpl.checkout(@mockingbird)
		jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
		@dpl.add_author(@charlotte_bronte)
		@dpl.add_author(@harper_lee)
		binding.pry		
		assert_equal true, @dpl.checkout(jane_eyre)
		assert_includes @dpl.checked_out_books, jane_eyre
		assert_equal false, @dpl.checkout(jane_eyre)
		@dpl.return(jane_eyre)
		assert_equal [], @dpl.checked_out_books
	end

	def test_most_popular_book
		jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
                @dpl.add_author(@charlotte_bronte)
                @dpl.add_author(@harper_lee)
		assert_equal nil, @dpl.most_popular_book
		@dpl.checkout(jane_eyre)
		@dpl.return(jane_eyre)
		assert_equal jane_eyre, @dpl.most_popular_book
	end
end
