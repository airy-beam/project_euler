#Problem 31
#
#In England the currency is made up of pound, £, and pence, p, 
#and there are eight coins in general circulation:
#
#    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
#It is possible to make £2 in the following way:
#
#    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
#How many different ways can £2 be made using any number of coins?


SUM = 200

$available_coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
$selected_coins = [ ]

$total = 0
$count = 0

def add_coin(min_coin)
  if $total == SUM then
    $count += 1
  else
    if $total < SUM then
      $available_coins.each { |coin| 
        if coin >= min_coin
          if ($total + coin <= SUM) then
            $total += coin
            $selected_coins << coin
            add_coin(coin)
            $total -= coin
            $selected_coins.pop
          end
        end
      }
    end
  end
end

add_coin(1)
print $count