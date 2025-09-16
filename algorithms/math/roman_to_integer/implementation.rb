# Roman to integer (romano para inteiro) - Mais informações no README

# Método que converte um numeral romano (string) em inteiro
def roman_to_integer (roman)
  # Garante que roman e string e em maiúscula
  roman = roman.to_s.upcase
  # Se for string vazia retorna 0
  if roman.empty?
    return 0
  end

  # Hash que mapeia cada caractere romano para seu valor inteiro
  romans = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  # Inicializa acumulador (resultado final)
  total = 0
  # Transforma a string em array de caracteres com o .chars
  chars = roman.chars

  # Percorre array de caracteres  da esquerda para direita com índice
  chars.each_with_index do |char, i|
    # Valor inteiro do caracter atual
    current_value = romans[char]
    # Pega o valor do próximo caractere; será nil se não existi
    next_value = if i + 1 < chars.size
      romans[chars[i + 1]]
    else
      nil
    end

    # Se existir um próximo valor e o valor atual for menor que o próximo, subtrai
    if next_value && current_value < next_value
      total -= current_value
    else
      # Caso contrário, soma o valor atual ao total
      total += current_value
    end
  end

  return total
end

# Testes
result = roman_to_integer("MCVIIV")

puts result