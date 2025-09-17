# Two sum hash map (duas somas, mapa de hash) - Mais informações README

def two_sum_optimized (array, target)
  # O papel dele é ser um "caderno de anotações" onde a chave é o número que você viu e o valor é o índice onde você o encontrou.
  seen_numbers = {}

  # Percorre o array e para cada iteração, você terá o num (o valor) e o i (o índice).
  array.each_with_index do |num, i|
    # Variável que calcula o que falta para chegar a target
    complement = target - num
    # Checa se o complement já existe no hash
    if seen_numbers[complement]
      # Se sim, retorna o valor (índice) do hash e o índice atual (i)
      return [seen_numbers[complement], i]
    end

    # Se não, adiciona o número atual e seu índice ao hash
    seen_numbers[num] = i
  end
  
end

#testes
entry = [3, 2, 4]
target = 6

result = two_sum_optimized(entry, target)

puts result.inspect