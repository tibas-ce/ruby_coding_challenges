# Reversal (reversão) - Mais informações README

def reversal_left (array, x)
  # Inverte só o valor de x. ex. [0..3] inverte os 4 primeiros números
  array[0...x] = array[0...x].reverse!
  # Inverte o array a parti de x. ex. [3..-1] inverte a partir do índice 3 até seu tamanho
  array[x..-1] = array[x..-1].reverse!
  # Inverte o array todo
  array = array.reverse!

  return array
end

# teste
lista = [1, 2, 3, 4, 5]
resultado = reversal_left(lista, 2)
puts resultado.inspect