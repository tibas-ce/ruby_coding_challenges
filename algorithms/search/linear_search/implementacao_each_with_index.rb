# Linear search (busca linear) - Mais informações readme

# Versão usando .each_with_index (mais idiomática, dispensa variável de índice manual)
def busca_linear_index (array, alvo)
  array.each_with_index do |valor, indice|
    return indice if valor == alvo
  end
  return -1
end
