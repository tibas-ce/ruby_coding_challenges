# Minimum sum (soma mínima) - Mais informações readme

def minimum_sum (array)
  # A variável less_value usa o método .min que retorna o menor elemento de uma coleção (array, range, hash, etc.).
  less_value = array.min
  # Calcula a soma minima que pode ocorrer
  minimum_sum = less_value * (array.length - 1)
  return minimum_sum
end

# teste

numeros = [4, 5, 15, 2, 1]

resultado = minimum_sum(numeros)

puts resultado.inspect