# Linear search (busca linear) - Mais informações readme

# arrays para cada caso
array = [10, 25, 43, 33, 190, 5]
array_primeiro = [43, 25, 343, 33, 190, 5]
array_ultimo = [10, 25, 23, 33, 190, 43]
array_sem = [10, 25, 56, 33, 190, 5]
alvo = 43

def busca_linear (array, alvo)
  indice = 0
  # Percorre cada elemento do array
  array.each do |i|
    if i == alvo
      # Retornando o indice, em caso de sucesso
      return indice
    end
    # Adiciona 1 ao indice a cada busca
    indice += 1
  end
  # Retorna -1 caso o alvo não seja encontrado no array
  return -1
end

# teste
reposta = busca_linear(array, alvo)
reposta2 = busca_linear(array_primeiro, alvo)
reposta3 = busca_linear(array_ultimo, alvo)
reposta4 = busca_linear(array_sem, alvo)

puts(reposta, reposta2, reposta3, reposta4)