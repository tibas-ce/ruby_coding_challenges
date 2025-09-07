# Habilitando biblioteca de testes
require "minitest/autorun"

# Carregar arquivos Ruby que estão no projeto.
require_relative "implementacao"

class TestCouting_sort < Minitest::Test
  def setup
    @arrays = {
      ordenado: (1..25).to_a,
      aleatorios: [4, 1, 5, 2, 3],
      vazio: [],
      um: [5],
      duplicado: [3, 2, 4, 4, 1, 2, 3, 5, 1, 3, 6, 1, 2, 3, 4],
      iguais: [2, 2, 2, 2, 2, 2, 2], 
      zero: [0, 1, 2, 3],
      menor_valores: [1, 1, 2, 2, 3],
      maior_valores: [50, 10, 25, 5, 2]
    }
  end

  def test_array_ordenado
    resultado = counting_sort(@arrays[:ordenado])
    # O resultado deve ser igual ao array original
    assert_equal @arrays[:ordenado], resultado
    # O array original não deve ser modificado
    assert_equal @arrays[:ordenado], @arrays[:ordenado]
    # O refute_same garante que não é o mesmo objeto, no teste garante que o counting_sort criou um novo array, mesmo que o conteúdo seja igual.
    # O retorno deve ser um novo objeto (não a mesma referência)
    refute_same @arrays[:ordenado], resultado
  end

  def test_array_elementos_aleatorios
    resultado = counting_sort(@arrays[:aleatorios])
    # O .sort retorna um array já ordenado
    # O resultado deve ser os dois arrays ordenados
    assert_equal @arrays[:aleatorios].sort, resultado
    # O assert_empty verifica se o objeto passado está vazio. Assim garante que todos os elementos estão presentes, sem sobras ou faltas.
    assert_empty @arrays[:aleatorios] - resultado # Nada do original está faltando
    assert_empty resultado - @arrays[:aleatorios] # Nada a mais foi adicionado
    # Confirmar que o array original não mudou
    assert_equal [4, 1, 5, 2, 3], @arrays[:aleatorios]
  end

  def test_array_vazio
    # Só de chamar counting_sort(@arrays[:vazio]) dentro do teste, já está validando que não quebrou.
    resultado = counting_sort(@arrays[:vazio])
    # Deve retornar array vazio
    assert_equal [], resultado
    # Verifica se estar retornando um array
    assert_kind_of Array, resultado
  end

  def test_array_um_elemento
    resultado = counting_sort(@arrays[:um])
    # Verifica se estar retornando um array
    assert_kind_of Array, resultado
    # Verifica tamanho, no caso 1
    assert_equal 1, resultado.size
    # Elemento deve ser o mesmo do original
    assert_equal @arrays[:um], resultado
  end

  def test_array_varios_elementos_duplicados
    resultado = counting_sort(@arrays[:duplicado])
    # Resultado ordenado deve manter todas as duplicatas. Contar se quantidade de cada número está correta. 
    assert_equal @arrays[:duplicado].sort, resultado
  end

  def test_array_elementos_iguais
    
  end
end