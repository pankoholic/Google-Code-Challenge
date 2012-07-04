class Googler
	attr_reader :points
	def initialize(points)
		@points = points
	end
	
	def at_least_p?(req_points = 0)
		if @points <= req_points
			return false
		end
		
		if @points == 0 && req_points == 0
			return true
		end
		
		if @points == 1 && req_points == 1
			return true
		end
		
		if @points > 28 && req_points > 8
				return true
		end
		
		if suprise?
			(1..10).each do |i|
				score1 = 3 * i
				score2 = 3 * i - 1
				score3 = 3 * i - 2
				if score1 == @points && i >= req_points
					return true
				end
				if score2 == @points && i >= req_points
					return true
				end
				
				if score3 == @points && i >= req_points
					return true
				end
			end
			(1..9).each do |i|
				score4 = 3 * i + 1
				if score4 == @points && (i + 1) >= req_points
					return true
				end
			end
			(1..8).each do |i|
				score5 = 3 * i + 2
				if score5 == @points && (i + 2) >= req_points
					return true
				end
			end
		end
		return false
	end
	
	def suprise?
		sup = [0, 1, 29, 30]
		if !sup.include?(@points)
			return true
		end
		return false
	end
end

t = gets.to_i
n = 0
s = 0
p = 0
googlers = Array.new
(0...t).each do |i|
	temp = gets.chomp
	googlers[i] = Array.new
	n = temp.split(" ")[0].to_i
	s = temp.split(" ")[1].to_i
	p = temp.split(" ")[2].to_i
	(3..(2+n)).each do |j|
		googlers[i] << Googler.new(temp.split(" ")[j].to_i)
	end
end

test = Googler.new(22)
p test.at_least_p?(9)
