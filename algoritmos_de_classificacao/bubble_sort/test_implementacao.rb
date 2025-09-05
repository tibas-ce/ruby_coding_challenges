# Habilitando biblioteca de testes
require "minitest/autorun"

# Carregar arquivos Ruby que estão no projeto.
require_relative "implementacao"

class TestBubbleSort < Minitest::Test

  def setup
    @arrays = {
      ordenado: (1..25).to_a,
      # O downto já gera a sequência invertida sem precisar criar e depois reverter. Poderiamos usar (1..25).to_a.reverse, más o downto serve melhor nesse caso
      inverso: 25.downto(1).to_a,
      vazio: [],
      um: [1],
      duplicado: [1, 2, 2, 4, 3, 9, 8, 7, 7, 6, 5],
      iguais: [2, 2, 2, 2, 2, 2, 2]
    }
  end

  def test_ordenado
    assert_equal (1..25).to_a, bubble_sort(@arrays[:ordenado]) 
  end

  def test_inverso
    assert_equal (1..25).to_a, bubble_sort(@arrays[:inverso]) 
  end

  def test_vazio
    assert_equal [], bubble_sort(@arrays[:vazio]) 
  end

  def test_um_elemento
    resultado = bubble_sort(@arrays[:um])
    # assert_kind_of verifica se um objeto é de um determinado tipo (classe ou módulo). Assim, não importa se o array é [2], [4] ou [999], o teste passa.
    assert_kind_of Array, resultado # garante que retornou um array
    assert_equal 1, resultado.length # garante que o array só tem um elemento
  end

  # Casos especiais
  def test_elementos_duplicados
    assert_equal [1, 2, 2, 3, 4, 5, 6, 7, 7, 8, 9], bubble_sort(@arrays[:duplicado])
  end

  def test_elementos_iguais
    assert_equal @arrays[:iguais], bubble_sort(@arrays[:iguais])
  end
end
