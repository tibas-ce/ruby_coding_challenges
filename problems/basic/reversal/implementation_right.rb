# Reversal (reversão) - Mais informações README

def reversal_rigth (array, x)
  # # Inverte o array todo
  array = array.reverse!
  # Diminui um, pois os índices em arrays começam em zero
  #x = x - 1
  # Inverte só o valor de x. ex. [0...3] inverte os 4 primeiros números
  array[0...x] = array[0...x].reverse!
  # Retorna ao valor original de x
  #x = x + 1
  # Inverte o array a parti de x. ex. [3..-1] inverte a partir do índice 3 até seu tamanho
  array[x..-1] = array[x..-1].reverse!
  # Retorna array
  return array
  
end

# teste
lista = [1, 2, 3, 4, 5, 6, 7]
resultado = reversal_rigth(lista, 3)
puts resultado.inspect