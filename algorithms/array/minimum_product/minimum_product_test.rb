# Importa biblioteca do minitest
require "minitest/autorun"

# Importa método
require_relative "./implementation"

class TestFindFuture < Minitest::Test
  def setup
    @test_only_positives = [1, 2, 3, 4, 5]
    @test_only_positives_mix = [5, 2, 7, 9, 6]
    @test_contains_zeros_without_negatives = [0, 2, 3, 4]
    @test_one_negative = [1, 3, -3]
    @test_negatives_odd = [5, -2, -3, -4]
    @test_negatives_pair = [-1, -2, -3, -4]
    @test_only_negatives_pair = [-1, -2]
    @test_only_negatives_odd = [-1, -2, -3]
    @test_array_with_zero_and_negatives = [-1, -2, 0, 3]
  end

  # Esperamos que o produto mínimo entre positivos seja o menor positivo do array
  def test_only_positives
    assert_equal 1, minimum_product(@test_only_positives)
    assert_equal 2, minimum_product(@test_only_positives_mix)
  end

  # Se não há negativos e há pelo menos um zero, a função deve devolver 0
  def test_contains_zeros_without_negatives
    assert_equal 0, minimum_product(@test_contains_zeros_without_negatives)
  end

  # Com um único negativo, o produto total fica negativo e é o mínimo
  def test_one_negative
    assert_equal (-9), minimum_product(@test_one_negative)
  end

  # Se há um número ímpar de negativos, o produto total será negativo e já é mínimo
  def test_negatives_odd
    assert_equal (-120), minimum_product(@test_negatives_odd)
  end
  
  # Com par de negativos o produto total é positivo; para minimizar, a função "remove" (divide por) o negativo mais próximo de zero
  def test_negatives_pair
    assert_equal (-24), minimum_product(@test_negatives_pair)
  end

  # Testa apenas negativos (pequenos arrays) para cobrir comportamentos simples
  def test_only_negatives
    # Dois negativos (par) → remove o maior negativo → resultado negativo
    assert_equal (-2), minimum_product(@test_only_negatives_pair)          
    # Três negativos (ímpar) → produto total (ímpar de negativos => negativo)
    assert_equal (-6), minimum_product(@test_only_negatives_odd)
  end

  # Mesmo com zeros, dependendo do mix o resultado pode ser 0 (por total_product = 0)
  def test_array_with_zero_and_negatives 
    assert_equal (0), minimum_product(@test_array_with_zero_and_negatives)
  end
end