# Maximize array (maximizar matrix) - Mais informações readme

def maximize_array (array, tunr)
  # Ordena o array.
  array_ordered = array.sort
  # Busca os números negativos por índice.
  array_ordered.each_with_index do |num, index|
    # Verifica se o número(num) e negativo, e se o tunr é > 0.
    if num < 0 && tunr > 0
      # Vira o número.
      array_ordered[index] = - num
      # Diminui uma virada.
      tunr = tunr - 1
    end
  end
  # O método .odd? verifica se o turn e ímpar(temos também o .even? que verifica par). Ou poderiamos ter usado turn % 2 != 0, mais “universal” (funciona em qualquer linguagem). 
  # Se a virada for ímpar, vire mais uma rodada.
  if tunr.odd?
    # Busca o menor valor no array pelo index.
    small_num = array_ordered.index(array_ordered.min)
    # Vira o menor número.
    array_ordered[small_num] = - array_ordered[small_num] 
  end 
  # .sum é um método do módulo Enumerable (ou seja, funciona em Arrays, Hashes, Ranges e outras coleções). Ele retorna a soma de todos os elementos.
  # Somando todos os valores.
  mazimize_sum = array_ordered.sum
  return mazimize_sum
end

# teste
num = [4, 5, 2,-3,0,-1,-6]

resposta = maximize_array(num, 10)

puts resposta.inspect