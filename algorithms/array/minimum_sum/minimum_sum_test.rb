# Importa biblioteca do minitest e date
require "minitest/autorun"

# Importa método
require_relative "./implementation"

class TestFindFuture < Minitest::Test
  def setup
    @positives = [3, 4, 5]
    @mix = [-2, -1, 0, 3]
    @one_element = [7]
    @equal = [5, 5, 5, 5]
    @large_array = (1..100).to_a
    @empty = []
    @with_nil = [nil, 1, 2]
    @with_floats = [1.5, 2.0, 3.0]
    @one_negative = [-7] 
    @array_with_strings = ["a", "b", "c"]
    @array_mixed = [1, "b", 3]
  end

  # Array com números positivos
  def test_array_with_positive_numbers
    assert_equal 6, minimum_sum(@positives)
  end

  # Array com números negativos e positivos
  def test_array_with_mix_numbers
    assert_equal (-6), minimum_sum(@mix)
  end

  # Array com apenas um elemento
  def test_array_one_element
    assert_equal 0, minimum_sum(@one_element)
  end

  # Array com todos elementos iguais
  def test_array_with_equal_elements
    assert_equal 15, minimum_sum(@equal)
  end

  # Array grande de 1 a 100
  def test_large_array
    assert_equal 99, minimum_sum(@large_array)
  end

  # Array vazio (caso extremo)
  def test_empty_array
    assert_raises(ArgumentError) {minimum_sum(@empty)}
  end

  # Array contendo nil (caso extremo)
  def test_array_with_nil
    assert_equal 1, minimum_sum(@with_nil)
  end

  # Array com floats (verifica comportamento em ponto flutuante)
  def test_array_with_floats
    # assert_in_delta quando está lidando com floats para evitar falhas por diferenças mínimas de arredondamento.
    # 1e-12 => margem de erro permitida (notação científica para 0.000000000001).
    assert_in_delta 3.0, minimum_sum(@with_floats), 1e-12 
  end

  # Array com único elemento negativo (verificação extra)
  def test_array_one_negative
    assert_equal 0, minimum_sum(@one_negative)
  end

  # Array com strings (caso inválido)
  def test_array_with_strings
    assert_raises(ArgumentError) { minimum_sum(@array_with_strings) }
  end

  # Array misto de números e strings (caso inválido)
  def test_array_with_numbers_and_strings
    assert_raises(ArgumentError) { minimum_sum(@array_mixed) }
  end
end