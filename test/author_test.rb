require_relative '../lib/book'
require_relative '../lib/author'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class AuthorTest < Minitest::Test

	def setup
		@charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
	end

	def test_it_has_attributes
		assert_equal "Charlotte Bronte", @charlotte_bronte.name
		assert_equal [], @charlotte_bronte.books
	end
	
	def test_write
		jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
		assert_instance_of Book, jane_eyre
		assert_equal "Jane Eyre", jane_eyre.title
		assert_equal 1, @charlotte_bronte.books.size
		@charlotte_bronte.write("Villette", "1853")
		assert_equal 2, @charlotte_bronte.books.size
		binding.pry
	end

end
