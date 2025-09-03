# Habilitando biblioteca de testes
require "minitest/autorun"

# Carregar arquivos Ruby que estão no projeto, relativamente ao arquivo 
require_relative "implementacao_each"
require_relative "implementacao_each_with_index"

class TestBuscaLinear < Minitest::Test
  # Método setup executado antes de cada teste. Define arrays de teste comuns e o alvo
  def setup
    @array = [10, 25, 43, 33, 190, 5]
    @array_primeiro = [43, 25, 343, 33, 190, 5]
    @array_ultimo = [10, 25, 23, 33, 190, 43]
    @array_sem = [10, 25, 56, 33, 190, 5]
    @array_iguais = [7, 7, 7, 7, 7]
    @array_duplicatas = [10, 25, 43, 43, 190, 5]
    @array_nil = [10, nil, 43, nil, 5]
    @array_tipos_mistos = [10, "25", 43, :symbol, 5]
    @array_muito_grande = (1..100_000).to_a
    @alvo = 43
    @alvo_nil = nil
  end

  # Testes da versão com each
  def test_each 
    assert_equal 2, busca_linear(@array, @alvo) # elemento no meio
  end
  
  def test_each_inicio 
    assert_equal 0, busca_linear(@array_primeiro, @alvo) # elemento no inicio
  end

  def test_each_ultimo 
    assert_equal 5, busca_linear(@array_ultimo, @alvo) # elemento no final
  end

  def test_each_inexistente 
    assert_equal(-1, busca_linear(@array_sem, @alvo)) # elemento inexistente
  end

  # Casos adicionais
  def test_each_array_iguais
    assert_equal 0, busca_linear(@array_iguais, 7) # retorna primeira ocorrêcia
  end

  def test_each_array_duplicatas
    assert_equal 2, busca_linear(@array_duplicatas, @alvo) # retorna primeira ocorrência
  end

  # Esse teste garante que a função de busca linear consegue lidar com valores nil, tanto como alvo quanto dentro do array. Ele também confirma que a função retorna o índice correto da primeira ocorrência.
  def test_each_array_nil
    assert_equal 2, busca_linear(@array_nil, @alvo)
    assert_equal 1, busca_linear(@array_nil, nil)
  end

  # Mesmo com tipos diferentes ele retorna o índice correto, o teste mostra que a função compara os valores corrretamente
  def test_each_array_tipos_mistos
    assert_equal 2, busca_linear(@array_tipos_mistos, @alvo)
  end

  def test_each_array_muito_grande
    assert_equal 42_000, busca_linear(@array_muito_grande, 42_001) # índice zero-based
  end

  def test_each_target_nil
    assert_equal(-1, busca_linear(@array, @alvo_nil)) # alvo nil não encontrado
  end

  # Testes da versão com each.with.index
  def test_each_with_index
    assert_equal 2, busca_linear_index(@array, @alvo) # elemento no meio
  end

  def test_each_with_index_inicio 
    assert_equal 0, busca_linear_index(@array_primeiro, @alvo) # elemento no inicio
  end

  def test_each_with_index_ultimo 
    assert_equal 5, busca_linear_index(@array_ultimo, @alvo) # elemento no final
  end

  def test_each_with_index_inexistente 
    assert_equal(-1, busca_linear_index(@array_sem, @alvo)) # elemento inexistente
  end

  # Casos adicionais
  def test_each_with_index_array_iguais
    assert_equal 0, busca_linear_index(@array_iguais, 7) # retorna primeira ocorrêcia
  end

  def test_each_with_index_array_duplicatas
    assert_equal 2, busca_linear_index(@array_duplicatas, @alvo) # retorna primeira ocorrência
  end

  # Esse teste garante que a função de busca linear consegue lidar com valores nil, tanto como alvo quanto dentro do array. Ele também confirma que a função retorna o índice correto da primeira ocorrência.
  def test_each_with_index_array_nil
    assert_equal 2, busca_linear_index(@array_nil, @alvo)
    assert_equal 1, busca_linear_index(@array_nil, nil)
  end

  # Mesmo com tipos diferentes ele retorna o índice correto, o teste mostra que a função compara os valores corrretamente
  def test_each_with_index_array_tipos_mistos
    assert_equal 2, busca_linear_index(@array_tipos_mistos, @alvo)
  end

  def test_each_with_index_array_muito_grande
    assert_equal 42_000, busca_linear_index(@array_muito_grande, 42_001) # índice zero-based
  end

  def test_each_with_index_target_nil
    assert_equal(-1, busca_linear_index(@array, @alvo_nil)) # alvo nil não encontrado
  end
end
