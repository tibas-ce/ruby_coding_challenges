# Find maximum sum possible equal sum three stacks - Hashing (Máximo de soma igual de três pilhas - sufixo) - Mais informações no README
# # Abordagem de Soma de Sufixo (Hashing)
# Esta é uma solução mais matemática. Em vez de remover elementos, a ideia é encontrar um valor que seja uma "soma de sufixo" comum a todas as três pilhas. O algoritmo pré-calcula todas as somas de sufixo possíveis de duas pilhas e as armazena em um conjunto de busca rápida (hash). Depois, ele percorre a terceira pilha e, para cada soma de sufixo, verifica se ela já foi vista nas outras duas pilhas, encontrando a maior soma comum.

def equal_stacks_max_sum_hashing (stacks)
  # novo hash para armazenar os arrays revertidos e somados
  sums = {}

  # para cada par key => array no hash original
  stacks.each do |key, array|
    # inicializa acumulador da soma em 0
    sum = 0
    # inicializa array que armazenará as somas cumulativas
    cumulative_sum = []

    # percorre o array de trás pra frente (último ao primeiro)
    array.reverse.each_with_index do |num, i|
      # adiciona o elemento atual ao acumulador
      sum += num
      # insere a soma acumulada no início do array
      cumulative_sum.unshift(sum)
      # armazena o array de somas cumulativas em sums usando a mesma chave
      sums[key] = cumulative_sum
    end
  end

  # result procura o primeiro valor de sums[:s3] que também esteja em sums[:s1] e sums[:s2]
  result = sums[:s3].find do |value|
    sums[:s1].include?(value) && sums[:s2].include?(value)
  end
  # Retorna o primeiro que satisfaça a condição ou retorna nil (não encontrou), define resultado para 0
  return result ||= 0
end

#testes
zero = {s1: [10], s2: [5], s3: [1]}
six = {s1: [1, 2, 3], s2: [4, 2], s3: [1, 5]}

puts equal_stacks_max_sum_hashing(zero)
puts equal_stacks_max_sum_hashing(six)