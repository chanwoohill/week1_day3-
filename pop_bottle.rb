CAP_TO_REDEEM = 4
BOTTLE_TO_REDEEM = 2
BOTTLE_COST = 2

@total_bottles = 0 
@bottles = 0
@caps = 0


def buy_bottles(investment)
  bottles_bought = investment / BOTTLE_COST
  @total_bottles = bottles_bought
  @bottles = bottles_bought
  @caps = bottles_bought
  @free_from_caps = 0
  @free_from_bottles = 0

  redeem
  show_info(investment, bottles_bought)
end

def show_info(investment, bottles_bought)
  puts "Money spent: $#{investment}"
  puts "Bottles purchased: #{bottles_bought}"
  puts "Free bottles from bottle recycling: #{@free_from_bottles}"
  puts "Free bottles from cap recycling: #{@free_from_caps}"
  puts "Total bottles of pop: #{@total_bottles}"
  puts "Left over caps: #{@caps}"
  puts "Left over bottles: #{@bottles}"
end

# calculate number of free bottles from recycled bottles/caps
def free_bottles_and_caps(bottles, caps)
  from_bottles = bottles / BOTTLE_TO_REDEEM
  from_caps = caps / CAP_TO_REDEEM 
  update_bottles(from_bottles, from_caps)
  from_bottles + from_caps
end

def update_bottles(from_bottles, from_caps)
  @free_from_bottles += from_bottles
  @free_from_caps += from_caps
end

def leftover_bottles(bottles)
  bottles % BOTTLE_TO_REDEEM
end

def leftover_caps(caps)
  caps % CAP_TO_REDEEM
end

# add free bottles in a recursive loop 
def redeem
  new_bottles = free_bottles_and_caps(@bottles, @caps)
  @bottles = new_bottles + leftover_bottles(@bottles)
  @caps = new_bottles + leftover_caps(@caps)
  @total_bottles += new_bottles
  redeem if redeemable?
end

def redeemable?
  @bottles >= BOTTLE_TO_REDEEM || @caps >= CAP_TO_REDEEM
end

def run_bottle_info
  while true
    print "How much are you going to spend on pop? "
    answer = gets.chomp
    break if answer.include?('quit') || answer.include?('exit')
    investment = answer.to_i
    buy_bottles(investment)
  end
end


run_bottle_info