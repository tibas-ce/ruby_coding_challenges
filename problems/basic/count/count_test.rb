# Importa biblioteca do minitest
require 'minitest/autorun'  
# Importa os métodos
require_relative 'implementation'    

# Criamos uma classe de teste, herdando de Minitest::Test
class TestCount < Minitest::Test
  def setup
    @phrase_mixed = "1jasdfjAJuioueAQ@#*(112)"
    @phrase_uppercase = "ABCDEF"
    @phrase_numbers = "1234567890"
    @phrase_special = "!@#$%^&*()"
    @phrase_empty_string = ""
  end

  # Teste com caracteres mistos
  def test_count_mixed_characters
    # Resultado esperado
    expected = {                          
      uppercase: 4,
      lowercase: 11,
      numbers: 4,
      special: 5
    }
    assert_equal expected, count(@phrase_mixed)
  end

  # Teste com apenas letras maiúsculas
  def test_count_only_uppercase
    # Resultado esperado
    expected = {                          
      uppercase: 6,
      lowercase: 0,
      numbers: 0,
      special: 0
    }
    assert_equal expected, count(@phrase_uppercase)
  end

  # Teste com apenas números
  def test_count_only_numbers
    # Resultado esperado
    expected = {                          
      uppercase: 0,
      lowercase: 0,
      numbers: 10,
      special: 0
    }
    assert_equal expected, count(@phrase_numbers)
  end

  # Teste com apenas caracteres especiais
  def test_count_only_special
    # Resultado esperado
    expected = {                          
      uppercase: 0,
      lowercase: 0,
      numbers: 0,
      special: 10
    }
    assert_equal expected, count(@phrase_special)
  end

  # Teste com string vazia
  def test_count_empty_string
    # Resultado esperado
    expected = {                          
      uppercase: 0,
      lowercase: 0,
      numbers: 0,
      special: 0
    }
    assert_equal expected, count(@phrase_empty_string)
  end
end