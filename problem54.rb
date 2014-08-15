#Problem 54
#
#In the card game poker, a hand consists of five cards and are ranked, 
#from lowest to highest, in the following way:
#
#High Card: Highest value card.
#One Pair: Two cards of the same value.
#Two Pairs: Two different pairs.
#Three of a Kind: Three cards of the same value.
#Straight: All cards are consecutive values.
#Flush: All cards of the same suit.
#Full House: Three of a kind and a pair.
#Four of a Kind: Four cards of the same value.
#Straight Flush: All cards are consecutive values of same suit.
#Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
#The cards are valued in the order:
#2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
#
#If two players have the same ranked hands then the rank made up 
#of the highest value wins; for example, a pair of eights beats 
#a pair of fives (see example 1 below). But if two ranks tie, 
#for example, both players have a pair of queens, then highest 
#cards in each hand are compared (see example 4 below); 
#if the highest cards tie then the next highest cards are compared, and so on.
#
#The file, poker.txt, contains one-thousand random hands dealt 
#to two players. Each line of the file contains ten cards 
#(separated by a single space): the first five are Player 1's cards 
#and the last five are Player 2's cards. You can assume that all 
#hands are valid (no invalid characters or repeated cards), each 
#player's hand is in no specific order, and in each hand 
#there is a clear winner.
#
#How many hands does Player 1 win?

class Card
  include Comparable
  
  VALUES = "23456789TJQKA"
  SUITS = "CDHS"
  NUMBER_OF_SUITS = 4
  
  def initialize(card)
   @card_value = VALUES.index(card[0]) * NUMBER_OF_SUITS + 
     SUITS.index(card[1])
  end
  
  def suit
    SUITS[@card_value % NUMBER_OF_SUITS, 1]
  end
  
  def value
    VALUES[@card_value / NUMBER_OF_SUITS, 1]
  end
  
  def -(rhs)
    VALUES.index(self.value) - VALUES.index(rhs.value)
  end
  
  def <=>(rhs)
    VALUES.index(self.value) <=> VALUES.index(rhs.value)
  end
  
end

class Hand
  attr_accessor :cards
  
  include Comparable
  
  RANKS = { :highcard => 0,
            :onepair => 1, 
            :twopairs => 2,
            :set => 3, 
            :straight => 4,
            :flush => 5, 
            :fullhouse => 6, 
            :quads => 7, 
            :straightflush => 8,
            :royalflush => 9 }
  
  def initialize(cards = [])
    @cards = cards
  end
  
  def countValues
    countOfValues = Hash.new(0)
    @cards.each do |card|
      countOfValues[ card.value ] += 1
    end
    countOfValues
  end
  
  def countSuits
    countOfSuits = Hash.new(0)
    @cards.each do |card|
      countOfSuits[ card.suit ] += 1
    end
    countOfSuits
  end
  
  def rank
    @cards.sort!
    countOfValues = self.countValues
    countOfSuits = self.countSuits
    
    #Royal Flush
    if countOfSuits.has_value? 5 then
      royalflush = true
      Card::VALUES[-5,5].scan(/./).each { |value| 
        if countOfValues[value] != 1 then royalflush = false end 
      }
      if royalflush then return :royalflush end
    end
    
    #Straight Flush
    if countOfSuits.has_value? 5 then
      straightflush = true
      1.upto(@cards.size - 1) { |i| 
        if @cards[i] - @cards[i - 1] != 1 then
          straightflush = false
        end
      }
      if straightflush then return :straightflush end
    end
    
    #Quads
    if countOfValues.has_value? 4 then return :quads end
    
    #Fullhouse
    if countOfValues.has_value?(3) && countOfValues.has_value?(2) then 
      return :fullhouse
    end
    
    #Flush
    if countOfSuits.has_value? 5 then return :flush end
    
    #Straight
    straight = true
    1.upto(@cards.size - 1) { |i| 
      if @cards[i] - @cards[i - 1] != 1 then
        straight = false
      end
    }
    if straight then return :straight end
    
    #Set
    if countOfValues.has_value? 3 then return :set end
    
    #Two pairs
    pairs = 0
    countOfValues.each { |value, count|
      if count == 2 then pairs += 1 end
    }
    if pairs == 2 then return :twopairs end
    
    #One Pair
    if countOfValues.has_value? 2 then return :onepair end
    
    #High card
    return :highcard
  end
  
  def compareHighCards(handOne, handTwo)
    handOne.cards.sort!.reverse!
    handTwo.cards.sort!.reverse!
    0.upto(handOne.cards.size - 1) do |i|
      if handOne.cards[i] > handTwo.cards[i] then return 1 end
      if handOne.cards[i] < handTwo.cards[i] then return -1 end
    end
    return 0
  end
  
  def compareEquallyRankedHands(handOne, handTwo)
    equal_rank = handOne.rank
    if ([:highcard, :straight, :flush, :straightflush, :royalflush].index(equal_rank)) then
      return compareHighCards(handOne, handTwo)
    end
    
    if ([:set, :quads, :fullhouse].index(equal_rank)) then
      if equal_rank == :quads then 
        value = 4
      else
        value = 3
      end
      if Card::VALUES.index(handOne.countValues.invert[value]) >
          Card::VALUES.index(handTwo.countValues.invert[value]) then
        return 1
      else
        return -1
      end
    end
    
    if (equal_rank == :onepair) then
      pairValueOne = Card::VALUES.index(handOne.countValues.invert[2])
      pairValueTwo = Card::VALUES.index(handTwo.countValues.invert[2])
      if pairValueOne > pairValueTwo then
        return 1
      else
        if pairValueOne < pairValueTwo then
          return -1
        else
          newHandOne = Hand.new
          newHandTwo = Hand.new
          handOne.cards.each { |card| newHandOne.cards << card unless
              handOne.countValues[card.value] == 2     
          }
          handTwo.cards.each { |card| newHandTwo.cards << card unless
              handTwo.countValues[card.value] == 2
          }
          return compareHighCards(newHandOne, newHandTwo)
        end
      end
    end
    
    if (equal_rank == :twopairs) then
      handOneValues = []
      handOne.countValues.each { |value, count| 
        if count == 2 then handOneValues << value end
      }
      handOneValues.sort!.reverse!
      
      handTwoValues = []
      handTwo.countValues.each { |value, count| 
        if count == 2 then handTwoValues << value end
      }
      handTwoValues.sort!.reverse!
      
      if ((handOneValues[0]>handTwoValues[0]) || (handOneValues[0]==handTwoValues[0] && handOneValues[1]>handTwoValues[1]) )
        return 1
      else 
        if ((handOneValues[0]<handTwoValues[0]) || (handOneValues[0]==handTwoValues[0] && handOneValues[1]<handTwoValues[1]) )
          return -1
        else
          newHandOne = Hand.new
          newHandTwo = Hand.new
          handOne.cards.each { |card| newHandOne.cards << card unless
              handOne.countValues[card.value] == 2     
          }
          handTwo.cards.each { |card| newHandTwo.cards << card unless
              handTwo.countValues[card.value] == 2
          }
          return compareHighCards(newHandOne, newHandTwo)
        end
      end
    end
  end
  
  def <=>(rhs)
    handOne = self.rank
    handTwo = rhs.rank
    if RANKS[handOne] > RANKS[handTwo] then
      return 1
    else
      if RANKS[handOne] < RANKS[handTwo] then
        return -1
      else
        compareEquallyRankedHands(self, rhs)
      end
    end
  end
  
end

count = 0
fpoker = File.new("input/poker.txt")
until fpoker.eof do
  deck = []
  line = fpoker.gets
  line.split(" ").each { |card| deck << Card.new(card) }
  hand1 = Hand.new(deck[0..4])
  hand2 = Hand.new(deck[5..9])
  if hand1 > hand2 then count += 1 end
end
print count
