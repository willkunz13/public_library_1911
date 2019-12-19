class Library
	
	attr_reader :name, :books, :authors, :checked_out_books, :total_checked_out_books

	def initialize(name)
		@name = name
		@books = []
		@authors = []
		@checked_out_books = []
		@total_checked_out_books = []
	end

	def add_author(author)
		authors << author
		books << author.books
		books.flatten!
	end
	
	def publication_time_frame_for(author)
		time_frame = {}
		time_frame[:start] = author.books.min { |a, b| a.publication_year <=> b.publication_year}.publication_year
		time_frame[:end] = author.books.max { |a, b| a.publication_year <=> b.publication_year}.publication_year
		time_frame
	end

	def checkout(book)
		if !books.include?(book)
			false
		elsif checked_out_books.include?(book)
			false
		else
			@checked_out_books << book
			@total_checked_out_books << book
			true
		end
	end

	def return(book)
		@checked_out_books.delete(book)
	end
	
	def most_popular_book
		total_checked_out_books.max_by {|book| total_checked_out_books.count(book)}
	end
		
end
