# Habilitando biblioteca de testes
require "minitest/autorun"

# Carregar arquivos Ruby que estão no projeto, relativamente ao arquivo atual.
require_relative "implementacao_each"
require_relative "implementacao_each_with_index"

class TestBuscaLinear < Minitest::Test
  # Método setup executado antes de cada teste. Define arrays de teste comuns e o alvo
  def setup
    @array = [10, 25, 43, 33, 190, 5]
    @array_primeiro = [43, 25, 343, 33, 190, 5]
    @array_ultimo = [10, 25, 23, 33, 190, 43]
    @array_sem = [10, 25, 56, 33, 190, 5]
    @alvo = 43
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
end
