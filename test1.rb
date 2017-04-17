# %3%5 in ruby

def checkFooBar(i)
	printed = ''
	if (i % 3 == 0)
		printed += "foo"
	end
	if (i % 5 == 0)
		printed += "bar"
	end
	if (printed.length > 0)
		puts "#{i} : #{printed}"
	end
end


puts '----- (1..15).each'
(1..15).each do |i|
	checkFooBar(i)
end

puts '----- loop do'

i = 1
loop do
	i += 1
	checkFooBar(i)
	break if i > 15
end

puts '------ while i < 15'

i = 1
while i < 15
	i += 1
	checkFooBar(i)
end

puts '------ until i > 15'

i = 1
until i > 15
	i += 1
	checkFooBar(i)
end

puts '------ for i in numbers'

numbers = (1..15)

for i in numbers
	printed = ''
	checkFooBar(i)
end

