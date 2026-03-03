require_relative "test_helper"
# require "date"

class TestFindFuture < Minitest::Test
  def setup
    @num_mixed = [4, 5, 2, -3, 0, -1, -6]
    @num_positive = [1, 2, 3, 4]
    @num_odd = [1, 2, -3]
    @num_pair = [-1, -2, -3]
  end

  # Verifica se a função funciona com números mistos
  def test_maximize_num_mixed
    assert_equal 21, RubyCodingChallenges::MaximizeArray.search(@num_mixed, 10)
  end

  # Array śo com números positivos
  def test_maximize_num_positive
    assert_equal 10, RubyCodingChallenges::MaximizeArray.search(@num_positive, 2)
  end

  # Quando o número de viradas é ímpar
  def test_maximize_turn_odd
    assert_equal 6, RubyCodingChallenges::MaximizeArray.search(@num_odd, 1)
  end

  # Quando o número de viradas é par
  def test_maximize_num_pair
    assert_equal 4, RubyCodingChallenges::MaximizeArray.search(@num_pair, 2)
  end
end