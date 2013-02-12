def edit_line(s)
  puts new_s = (s.upcase.split(/[^A-Z]+/).map do |word|
     word = ( word.match(/\AP[a-zA-Z]*R\z/) or word.match(/\AH[a-zA-Z]*O/) )? "#" * word.length : word
  end).join(" ")
end

def multi_line_edit(lines)
  if (num = lines[0].to_i) <= 100 then
    1.upto(num) do |i| 
      s = lines[i].match(/\n/) ? lines[i].chop : lines[i] 
      edit_line(s) if s.length.between?(1, 80)
    end 
  end   
end

lines = File.readlines("carta.txt")
multi_line_edit(lines)
