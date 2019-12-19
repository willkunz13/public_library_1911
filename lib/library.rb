class Library
	
	attr_reader :name, :books, :authors

	def initialize(name)
		@name = name
		@books = []
		@authors = []
	end

	def add_author(author)
		authors << author
		books << author.books
	end
	
	def publication_time_frame_for(author)
		time_frame = {}
		time_frame[:start] = author.books.min { |a, b| a.publication_year <=> b.publication_year}.publication_year
		time_frame[:end] = author.books.max { |a, b| a.publication_year <=> b.publication_year}.publication_year
		time_frame
	end
end
