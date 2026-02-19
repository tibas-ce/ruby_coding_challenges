require_relative "test_helper.rb"

class TestBuscaBinaria < Minitest::Test
  def setup
    @arrays = {
      # (1..25) cria um range com 25 números, o .to_a transforma esse ranger em um array
      array_ordenado: (1..25).to_a,
      array_sem_alvo: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      array_vazio: []
    }
    @alvos = {
      alvo: 11,
      alvo_inicio: 2,
      alvo_meio: 14,
      alvo_fim: 23
    }
  end

  # Testes da versão interativa
  # O valor 11 está na 11ª posição da lista, mas como os índices começam em 0, o retorno esperado é 10.
  def test_pesquisa_binaria_interativa_encontra_alvo
    assert_equal 10, RubyCodingChallenges::BinarySearch::Iterative.search(@arrays[:array_ordenado], @alvos[:alvo])
  end

  def test_pesquisa_binaria_interativa_encontra_alvo_inicio
    assert_equal 1, RubyCodingChallenges::BinarySearch::Iterative.search(@arrays[:array_ordenado], @alvos[:alvo_inicio])
  end

  def test_pesquisa_binaria_interativa_encontra_alvo_meio
    assert_equal 13, RubyCodingChallenges::BinarySearch::Iterative.search(@arrays[:array_ordenado], @alvos[:alvo_meio])
  end

  def test_pesquisa_binaria_interativa_encontra_alvo_fim
    assert_equal 22, RubyCodingChallenges::BinarySearch::Iterative.search(@arrays[:array_ordenado], @alvos[:alvo_fim])
  end

  def test_pesquisa_binaria_interativa_alvo_nao_encontrado
    assert_nil RubyCodingChallenges::BinarySearch::Iterative.search(@arrays[:array_sem_alvo], @alvos[:alvo])
  end

  def test_pesquisa_binaria_interativa_array_vazio
    assert_nil RubyCodingChallenges::BinarySearch::Iterative.search(@arrays[:array_vazio], @alvos[:alvo])
  end

  # Testes da versão recursiva
  def test_pesquisa_binaria_recursiva_encontra_alvo
    assert_equal 10, RubyCodingChallenges::BinarySearch::Recursive.search(@arrays[:array_ordenado], @alvos[:alvo])
  end

  def test_pesquisa_binaria_recursiva_encontra_alvo_inicio
    assert_equal 1, RubyCodingChallenges::BinarySearch::Recursive.search(@arrays[:array_ordenado], @alvos[:alvo_inicio])
  end

  def test_pesquisa_binaria_recursiva_encontra_alvo_meio
    assert_equal 13, RubyCodingChallenges::BinarySearch::Recursive.search(@arrays[:array_ordenado], @alvos[:alvo_meio])
  end

  def test_pesquisa_binaria_recursiva_encontra_alvo_fim
    assert_equal 22, RubyCodingChallenges::BinarySearch::Recursive.search(@arrays[:array_ordenado], @alvos[:alvo_fim])
  end

  def test_pesquisa_binaria_recursiva_alvo_nao_encontrado
    assert_nil RubyCodingChallenges::BinarySearch::Recursive.search(@arrays[:array_sem_alvo], @alvos[:alvo])
  end

  def test_pesquisa_binaria_recursiva_array_vazio
    assert_nil RubyCodingChallenges::BinarySearch::Recursive.search(@arrays[:array_vazio], @alvos[:alvo])
  end
end
