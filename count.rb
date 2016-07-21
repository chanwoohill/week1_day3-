def count_letters(sentence)
  counts = {}
  sentence.each_char do |char|
    if counts[char] 
      counts[char] += 1 
    else
      counts[char] = 1
    end
  end
  counts
end 

puts count_letters("lighthouse in the house...")

def count_index(text)
  letters = text.scan(/[^\s]/)
  counts = {}
  letters.each do |letter, index|
    if counts[letter].nil?
      counts[letter] = []
    else
      counts[letter] << index
    end
  end
  puts counts
end

count_index("lighthouse in the house...")