# Find three (buscar três) - Mias informações README

def find_three (array)
  # Infinity representa menos infinito matematicamente. É um valor numérico especial da classe Float. Ele é menor do que qualquer outro número real.
  # -Float::INFINITY começa com um valor numérico válido. Não precisa de verificação extra no loop. Sempre que comparar, qualquer número real será maior que -Infinity.
  largest = -Float::INFINITY
  second_largest = -Float::INFINITY
  third_largest = -Float::INFINITY

  # Percorrendo array e verificando
  array.each do |item|
    # Verifica se item e maior que largest
    if item > largest
      # Substitui third_largest por second_largest
      third_largest = second_largest
      # Substitui second_largest por largest 
      second_largest = largest
      # Substitui largest por item
      largest = item
    elsif item > second_largest && item != largest
      # Substitui third_largest por second_largest
      third_largest = second_largest
      # Substitui second_largest por item 
      second_largest = item
    elsif item > third_largest && item != largest && item != second_largest
      # Substitui third_largest por item
      third_largest = item
    end
  end
  # Adicionando variáveis a um array, filtrando valores iniciais
  three_largest = []
  # Se largest for diferente de -Float::INFINITY add ao three_largest
  three_largest.push(largest) if largest != -Float::INFINITY
  # Se second_largest for diferente de -Float::INFINITY add ao three_largest
  three_largest.push(second_largest) if second_largest != -Float::INFINITY
  # Se third_largest for diferente de -Float::INFINITY add ao three_largest  
  three_largest.push(third_largest) if third_largest != -Float::INFINITY
    
  return three_largest.inspect
end

# teste
lista = [-15]
lista2 = [0, 25, 10, 150, 90, 6]
lista3 = [-4, -1]

puts find_three(lista)
puts find_three(lista2)
puts find_three(lista3)