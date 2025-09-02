# Linear search (busca linear) - Mais informações readme

# arrays para cada caso
array = [10, 25, 43, 33, 190, 5]
array_primeiro = [43, 25, 343, 33, 190, 5]
array_ultimo = [10, 25, 23, 33, 190, 43]
array_sem = [10, 25, 56, 33, 190, 5]
alvo = 43

# Versão usando .each_with_index (mais idiomática, dispensa variável de índice manual)
def busca_linear (array, alvo)
  array.each_with_index do |valor, indice|
    return indice if valor == alvo
  end
  return -1
end

# teste
resposta = busca_linear(array, alvo)
resposta2 = busca_linear(array_primeiro, alvo)
resposta3 = busca_linear(array_ultimo, alvo)
resposta4 = busca_linear(array_sem, alvo)

puts(resposta, resposta2, resposta3, resposta4)