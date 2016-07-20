def to_roman(num)
  roman_numerals = {
    1 => {
      symbol: 'I',
      count: ones(num)
      },
    5 => {
      symbol: 'V',
      count: fives(num)
      },
    10 => {
      symbol: 'X',
      count: tens(num)
      },
    50 => {
      symbol: 'L',
      count: fifties(num)
      },
    100 => {
      symbol: 'C',
      count: hundreds(num)
      },
    500 => {
      symbol: 'D',
      count: five_hundreds(num)
      },
    1000 => {
      symbol: 'M',
      count: thousands(num)
      }
  }

  nonzero_counts = roman_numerals.values.select { |value| value[:count] > 0}

  converted_number = ""

  nonzero_counts.reverse.each do |hash|
    hash[:count].times do
      converted_number << hash[:symbol]
    end
  end
  
  converted_number
end

def thousands(num)
  num / 1000
end

def five_hundreds(num)
  (num % 1000) / 500
end

def hundreds(num)
  (num % 500) / 100
end

def fifties(num)
  (num % 100) / 50
end

def tens(num)
  (num % 50) / 10
end

def fives(num)
  (num % 10) / 5
end

def ones(num)
  (num % 5)
end
 
# Drive code... this should print out trues.
 
puts to_roman(4) == "IIII"
puts to_roman(9) == "VIIII"
puts to_roman(14) == "XIIII"
 
# TODO: what other cases could you add to ensure your to_roman method is working?

puts to_roman(946)