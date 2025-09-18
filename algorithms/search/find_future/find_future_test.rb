# Importa biblioteca do minitest e date
require "minitest/autorun"
require "date"

# Importa os métodos
require_relative "implementation_efficient"
require_relative "implementation_naive"

class TestFindFuture < Minitest::Test
  def setup
    @dates = ["22/04/1233", "1/03/633", "23/05/56645"]
    # 32/13/2020 não existe
    @date_not_exist = ["32/13/2020", "15/08/2500"]
    # String vazia
    @invalid_date = ["", "datas", "32/13/2020", "15/08/2500"]
  end

  # Testes para find_future_efficient
  # Caso normal: existe uma data futura em relação à data consultada
  def test_future_exists_efficient
    assert_equal Date.new(1233, 4, 22), find_future_efficient(@dates, "1/01/1000")
  end

  # Nenhuma data futura existe (consult_date maior que todas do array)
  def test_no_future_date_efficient
    # Nesse caso retorno deve ser nil
    assert_nil find_future_efficient(@dates, "1/01/70000")
  end

  # Teste com uma data inválida no array
  def test_invalid_date_in_array_efficient
    assert_equal Date.new(2500,8,15), find_future_efficient(@date_not_exist, "1/1/2000")
  end
  
  # Quando a consult_date é exatamente igual a uma das datas
  def test_consult_date_equal_efficient
    assert_equal Date.new(1233,4,22), find_future_efficient(@dates, "22/4/1233")
  end

  # Testes para find_future_naive
  # Caso normal: existe uma dat futura
  def test_future_exists_naive
    assert_equal Date.new(1233,4,22), find_future_naive(@dates, "1/1/1000")
  end

  # Nenhuma data futura existe
  def test_no_future_exists_naive
    #result = 
    assert_equal(-1, find_future_naive(@dates, "1/1/70000")) 
  end

  # Teste com strings inválida ou vazias
  def test_invalid_date_array_naive
    assert_equal Date.new(2500,8,15), find_future_naive(@date_not_exist, "1/1/2000")
  end

  # Quando a cunsult_date é exatamente igual a uma data
  def test_consult_date_equal_naive
    assert_equal Date.new(1233,4,22), find_future_naive(@dates, "22/4/1233")
  end
end