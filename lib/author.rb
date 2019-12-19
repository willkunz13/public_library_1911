require_relative 'book.rb'

class Author

	attr_reader :name, :books
	
	def initialize(author_info)
		@name = author_info[:first_name] + " " + author_info[:last_name]
		@books = []
	end
	
	def write(title, publication_date)
		book_info = {}
		book_info[:author_first_name] = name.split.first
		book_info[:author_last_name] = name.split.last.strip
		book_info[:title] = title
		book_info[:publication_date] = publication_date
		books << Book.new(book_info)
		books.last
	end
		
end
