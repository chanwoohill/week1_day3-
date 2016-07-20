@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan',
}

@states[:WA] = 'Washington'
@states[:IL] = 'Illinois'

@cities = {
  OR: ['Portland', 'Salam'],
  FL: ['Orlando', 'Miami'],
  CA: ['LA', 'San Fran'],
  NY: ['NYC', 'Buffalo', 'Syracuse'],
  MI: ['Detroit', 'Flint'],
  WA: ['Seattle', 'Tacoma', 'Vancouver', 'Kent'],
  IL: ['Chicago', 'Aurora', 'Rockford'],
}


#'CA is for California. It has 2 major cities: San Francisco, LA'#

def describe_state(state_code)
  state = state_code.to_sym
  state_name = @states[state]
  city_count = @cities[state].count
  cities = @cities[state].join(', ')
  describe = "#{state} is for #{state_name}. It has #{city_count} major cities: #{cities}."
  describe
end

@taxes = {
  OR: 3,
  FL: 4,
  CA: 10,
  NY: 24,
  MI: 3,
  IL: 7.5,
  WA: 43,
}

def calculate_tax(state_code, amount)
  state = state_code.to_sym
  tax_rate = @taxes[state].to_f / 100
  tax_amount = (tax_rate * amount).round(2)
end


def find_state_for_city(city_name)
  state = @cities.select { |state_code, cities| cities.include? city_name }
  state.keys
end


puts describe_state('WA')
puts describe_state(:FL)
puts describe_state('IL')

puts calculate_tax('WA', 100.72)

puts find_state_for_city('Vancouver')