class Book

	attr_reader :title, :author, :publication_year

	def initialize(book_info)
		@title = book_info[:title]
		@publication_year = book_info[:publication_date].split(',').last.strip
		@author = book_info[:author_first_name] + " " +  book_info[:author_last_name]
	end

end
