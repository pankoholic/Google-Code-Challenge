def pair(a, b)
	total = 0
	array = Array.new
	(a...b).each do |n|
		((n+1)..b).each do |m|
			(0...n.to_s.length).each do |i|
				temp = n.to_s[i, n.to_s.length] + n.to_s[0, i]
				if temp == m.to_s && !array.include?("(#{n}, #{m})")
					total += 1
					array << "(#{n}, #{m})"
				end
			end
		end
	end
	return total
end

t = gets.to_i
(1..t).each do |i|
	p = gets.chomp
	a = p.split(" ")[0].to_i
	b = p.split(" ")[1].to_i
	total = pair(a, b)
	puts "Case ##{i}: " + total.to_s
end