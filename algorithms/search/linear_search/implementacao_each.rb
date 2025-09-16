# Linear search (busca linear) - Mais informações readme

# busca_linear com .each
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