# Importa biblioteca do minitest
require 'minitest/autorun'  
# Importa os métodos
require_relative 'implementation'    

# Criamos uma classe de teste, herdando de Minitest::Test
class RemoveElementTest < Minitest::Test
  # Definimos o array e os alvos
  def setup
    @numbers_basic = [3, 2, 2, 3, 4, 5, 6, 3]
    @target_basic = 3
    @numbers_equal = [7, 7, 7]
    @target_equal = 7
    @numbers_nonexistent = [1, 2, 3, 4]
    @target_nonexistent = 5
    @numbers_empty = []
    @target_empty = 1
  end

  # O método .take(n) é do Ruby e serve para pegar os primeiros n elementos de um array. A função remove_element não apaga fisicamente os elementos indesejados do array, só sobrescreve os válidos no começo e devolve a quantidade que deve ser considerada. Usamos .take(result) nos testes para assim olhamos apenas para os elementos que realmente importam. 
  def test_remove_element_basic
    result = remove_element(@numbers_basic, @target_basic)
    assert_equal 5, result
    # Verifica se os primeiros 5 elementos são os esperados
    assert_equal [2, 2, 4, 5, 6], @numbers_basic.take(result) 
  end

  def test_remove_all_elements
    result = remove_element(@numbers_equal, @target_equal)
    assert_equal 0, result
    # Verifica que a lista final é vazia
    assert_equal [], @numbers_equal.take(result)
  end

  def test_remove_no_elements
    result = remove_element(@numbers_nonexistent, @target_nonexistent)
    assert_equal 4, result
    # Verifica se o array continua igual
    assert_equal [1, 2, 3, 4], @numbers_nonexistent.take(result)
  end

  def test_empty_array
    result = remove_element(@numbers_empty, @target_empty)
    assert_equal 0, result
    # Array continua vazio
    assert_equal [], @numbers_empty.take(result)
  end
end