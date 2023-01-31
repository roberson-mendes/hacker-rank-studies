def towerBreakers(n, m)
  # Write your code here

  return 2 if(m == 1)
  return 2 if(n % 2 == 0)
  1
end

#scenario: m = 1
#when m = 1, the player 1 has no moves, because if it removes 1,
#y < 0, therefore, the rule 1 <= y < x isn't obeyed
#so player 2 wins always when m = 1
def test_1
  n = 1
  m = 1
  expected_result = 2

  result = towerBreakers(n, m)

  p "test_1 passed?: #{result == expected_result} "
end

#scenario: n = 1, m is even
# when n=1 and m=2
# first player removes 1 to not to lose
# second player lose because 1 <= y and it can't remove any height
def test_2
  n = 1
  m = 2
  expected_result = 1

  result = towerBreakers(n, m)

  p "test_2 passed?: #{result == expected_result}"
end

#scenario: n = 1, m is even
#when n = 1 and m = 4,
# player 1 removes 3
# player 2 has no move
#so, given that both players always play optimally, player 1 will
#always remove x heights so that x - y = 1, therefore it will defeats
#player 2 always when n = 1 and m > 1
def test_3
  n = 1
  m = 4
  expected_result = 1

  result = towerBreakers(n, m)

  p "test_3 passed?: #{result == expected_result}"
end

def test_4
  n = 2
  m = 2
  expected_result = 2

  result = towerBreakers(n, m)

  p "test_4 passed?: #{result == expected_result}"
end

#player 1: reduces 2 from n-1, n-1 = 2
#player 2: reduces 2 from n-2, n-2 = 2
#player 1: reduces 1 from n-1, n-1 = 1
#player 2 wins
#therefore, if n%2=0, player 2 will always wins, because p1 is the first
# player to reduce the towers and the first to get in n-1 = 1, because
# player 2 can always imitates his steps and win the game
def test_5
  n = 2
  m = 4
  expected_result = 2

  result = towerBreakers(n, m)

  p "scenario 'n = 2, m = 4' passed? #{result == expected_result}"
end

#player 1 has 2 options: reduce by 3 or reduce by 2.
# In the case p1 reduces by 3,
# it will lose, because player 2 will make the same and player 1 will
# take the last step with no option.
#if player 1 reduces by 2, it will get one more turn to get in the
#same scenario as test_5, because if n%2, it is as the match has been
#duplicated, because when player 1 went to m-3, it will have m-3 = 4 again
#and have to make the same moves as when he was in m-1.
#there is...
#If n%2=0, player 2 will always win.
#And even if the m is odd, because the diference between m even and odd
#is that when m is odd or is multiple of a number,
#the game  just can take more turns to reach it's end
def test_6
  n = 4
  m = 4
  expected_result = 2

  result = towerBreakers(n, m)

  p "scenario 'n = 4', 'm = 4' passed?: #{result == expected_result}"
end

#scenario 1
#player 1 reduces n-1 by 3, n-1 = 1
#player 2 reduces n-2 by 3, n-2 = 1
#player 1 reduces n-3 by 3, n-3 = 1
#player 1 wins

#player 1 reduces n-1 by 3, n-1 = 1
#player 2 reduces n-2 by 2, n-2 = 2
#player 1 reduces n-3 by 2, n-3 = 2
#player 2 reduces n-2 by 1, n-2 = 1
#player 1 reduces n-3 by 1, n-3 = 1
#player 1 wins
#so even if the player 2 tries to have more rounds by reducing less of
#his first tower, he will always loses the game when, because player 1
#will always have the last play and will win the game if he plays
#optimally.
#Therefore, if n is odd, the player 1 will always win the game, because
#even if player-2 make his best, players 1 can imitate him and just be
#the last player to play
def test_7
  n = 3
  m = 4
  expected_result = 1

  result = towerBreakers(n, m)

  p "scenario n = 3, m = 4 passed?: #{result == expected_result}"
end

test_1
test_2
test_3
test_4
test_5
test_6

#conclusions:
#If the n is even, player 1 always loses the game.
#If m = 1, player 2 always wins the game
#If n is odd, player 2 always wins the game
#Unless m = 1, m has no influence to the winner when both play optimally,
#because all it can does is increase the rounds.
