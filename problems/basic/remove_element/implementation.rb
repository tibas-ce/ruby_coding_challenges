# Remove the element (remove o elemento) - Mais informações README

# FUnção que remove do array todo elemento igual a target
def remove_element (array, target)
  # Usado para rastrear a posição do próximo elemento valido
  collector = 0

  # Percorrendo cada número do array
  array.each do |num|
    # Verifica se num e diferente de target. Se num for igual a target, o collecctor não se move. O elemento é simplesmente "ignorado".
    if num != target
      # Pega num e coloca na posição onde o collector está
      array[collector] = num
      # Adiciona +1 ao collector
      collector += 1
    end
  end
  
  return collector
end

# Testes
numbers = [3, 2, 2, 3, 4, 5, 6, 3]
target = 3

result = remove_element(numbers, target)

puts result