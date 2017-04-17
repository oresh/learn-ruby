# work with strings

class Stringer
	attr_accessor :string

	def initialize(s)
	    @string = s
	    freeze
	end

	def change(changer)
		@string = changer
	end

	def to_s
		@string.to_s
	end

	def str
		@to_s
	end

	def replace(what, replacer)
		@string.sub(what, replacer)
	end

	def replace_all(what, replacer)
		@string.gsub(what, replacer)
	end

	def includes(what)
		@string.include? what
	end

	def index_of(what)
		@string.index(what)
	end

	def clean
		str = @string.lstrip
		str.rstrip
	end

	def to_i
		@string.to_i
	end

	def length
		@string.length
	end

	def lower_case
		@string.downcase
	end

	def upper_case
		@string.upcase
	end

	def first
		@string[0]
	end

	def last
		@string[@string.length-1]
	end	

	def split_once(splitter)
		ind = self.index_of(splitter)
		if (ind >= 0)
			slice_to = ind + splitter.length
			[self.slice(0, ind), self.slice(slice_to, self.length)]
		else
			false
		end
	end

	def split(splitter)
		@string.split(splitter)
	end

	def slice(from, count = 1)
		@string.slice(from, count)
	end

	def substr(from, count = 1)
		self.slice(from, count)
	end

	def trunc(length)
		self.slice(0, length)
	end

	def vowels
		@string.count("aioue")
	end

	def consonants
		str = self.slugify
		str.count("^aioue-")
	end

	def get_words
		self.split(' ')
	end

	def count_words
		self.get_words.count
	end

	def reverse
		@string.reverse
	end

	def slugify
		@string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
	end

	def << text
		@string + ' ' + text.to_s
	end
end

str = Stringer.new("Horosho byti doma")

puts "str.str : #{str.str}"
puts "str.last : #{str.last}"
puts "str.first : #{str.first}"
puts "str.to_s : #{str.to_s}"
puts "str.slugify : #{str.slugify}"
puts "str.replace : #{str.replace('o', '!')}"
puts "str.replace_all : #{str.replace_all('o', '!')}"
puts "str.includes : #{str.includes('byt')}"
puts "str.index_of : #{str.index_of('h')}"
puts "str.clean : #{str.clean}"
puts "str.to_i : #{str.to_i}"
puts "str.length : #{str.length}"
puts "str.lower_case : #{str.lower_case}"
puts "str.upper_case : #{str.upper_case}"
puts "str.split : #{str.split('o')}"
puts "str.split_once : #{str.split_once('o')}"
puts "str.slice : #{str.slice(12,3)}"
puts "str.trunc : #{str.trunc(6)}"
puts "str.vowels : #{str.vowels}"
puts "str.consonants : #{str.consonants}"
puts "str.reverse : #{str.reverse}"
puts "str.get_words : #{str.get_words}"
puts "str.count_words : #{str.count_words}"
puts str << '123' << '4'
# puts str.change('hello') # will cause error cause of freeze