class Level
	attr_reader :onestar, :twostar, :done
	def initialize(onestar, twostar)
		@onestar = onestar
		@twostar = twostar
		@done_two = false
		@done_one = false
	end
	
	def done_two
		@done_two = true
	end
	
	def done_one
		@done_one = true
	end
	
	def done_two?
		return @done_two
	end
	
	def done_one?
		return @done_one
	end
end

t = gets.to_i
cases = [] * t

(0...t).each do |i|
	n = gets.to_i
	cases[i] = Array.new
	(0...n).each do |j|
		temp = gets.chomp
		cases[i] << Level.new(temp.split(" ")[0].to_i, temp.split(" ")[1].to_i)
	end
end
count = [0] * t
(0...t).each do |i|
	did = 0
	stars = 0
	while stars < (cases[i].size * 2)
		temp = true
		tempcount = count[i]
		(0...cases[i].size).each do |j|
			if stars >= cases[i][j].twostar && !cases[i][j].done_two?
				if !cases[i][j].done_one?
					stars += 2
					#did += 1
					count[i] += 1
					cases[i][j].done_one
					cases[i][j].done_two
					temp = false
					break
				else
					stars += 1
					count[i] += 1
					cases[i][j].done_two
					#did += 1
					temp = false
					break
				end
			end
		end
		if temp
			(0...cases[i].size).each do |j|
				if stars >= cases[i][j].onestar && !cases[i][j].done_one?
					cases[i][j].done_one
					stars += 1
					count[i] += 1
					break
				end
			end
		end
		if count[i] == tempcount
			count[i] = 0
			break
		end
	end
end
(1..count.size).each do |i|
	if count[i-1] == 0
		puts "Case ##{i}: Too Bad"
	else
		puts "Case ##{i}: #{count[i-1]}"
	end
end