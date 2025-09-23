# Find maximum sum possible equal sum three stacks (Máximo de soma igual de três pilhas) - Mais informações no README
# Abordagem Gulosa (Greedy)
# A estratégia aqui é sempre fazer a melhor escolha no momento:
# Para igualar as somas das pilhas, a maneira mais rápida é reduzir a pilha que tem o valor mais alto.
# O algoritmo remove o elemento do topo da pilha com a maior soma em cada passo, fazendo com que as somas convirjam para o mesmo valor, de forma eficiente. Se as somas não puderem ser igualadas, o algoritmo retorna 0.

def equal_stacks_max_sum_greedy(stacks)
  # Método de Hash em Ruby, ele percorre o hash e mantém as chaves, mas transforma cada valor usando o bloco { |array| array.sum }: define como cada valor vai ser transformado (aqui, pegando a soma dos elementos).
  sums = stacks.transform_values{|array| array.sum}

  loop do
    # Condição de parada: se todas as somas são iguais, retornamos qualquer soma
    if sums[:s1] == sums[:s2] && sums[:s2] == sums[:s3]
      return sums[:s1]
    end
    
    # Se alguma pilha estiver vazia, não há como igualar acima de 0
    if stacks[:s1].empty? || stacks[:s2].empty? || stacks[:s3].empty?
      return 0
    end
    
    # Encontrar a pilha com a maior soma
    # O método .max_by em Ruby é usado para encontrar o elemento "máximo" de uma coleção com base em um critério definido por um bloco. O bloco { |key, value| value } Aqui, está dizendo: “para cada par (key, value), quero comparar pelo value”.
    max_key, max_value = sums.max_by {|key, value| value}

    # Remover o elemento do topo da pilha com a maior soma
    remove_element = stacks[max_key].shift
    
    # Atualizar a soma
    sums[max_key] -= remove_element
  end
end


# teste
return_zero = {s1: [1, 1, 3], s2: [2, 1, 2], s3: [4]}
return_equal = {s1: [2, 8], s2: [5, 5], s3: [3, 4, 3]}
return_process = {s1: [3, 1, 1, 1], s2: [2, 3], s3: [1, 5, 2]}

puts equal_stacks_max_sum(return_zero).inspect
puts equal_stacks_max_sum(return_equal).inspect
puts equal_stacks_max_sum(return_process).inspect