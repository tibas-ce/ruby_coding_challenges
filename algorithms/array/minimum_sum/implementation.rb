# Minimum sum (soma mínima) - Mais informações readme

def minimum_sum (array)
  # .compact remove nils
  array = array.compact
  # Verifica se array e vazio
  if array == []
    raise ArgumentError, "Array vazio, não é possivel fazer soma minima"
  end
  # Verifica se todos os elementos são números
  unless array.all? { |e| e.is_a?(Numeric) }
    raise ArgumentError, "Array contém elementos não numéricos"
  end
  # A variável less_value usa o método .min que retorna o menor elemento de uma coleção (array, range, hash, etc.).
  less_value = array.min
  # Calcula a soma minima que pode ocorrer
  minimum_sum = less_value * (array.length - 1)
  return minimum_sum
end

