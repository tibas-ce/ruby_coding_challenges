# Two sum (duas somas) - Mais informações README
# Esta é a forma mais direta de resolver o problema. A ideia é verificar cada par de números possíveis no array. Esta abordagem funciona perfeitamente, mas pode ser lenta se o array for muito grande, pois você faz muitas verificações desnecessárias.

# Função que encontra a posição de dois números no array que, quando somados, dão o valor do alvo (target).
def two_sum (array, target)
  # Percorre o array do primeiro até o penúltimo. 0...(array.length - 1) Vai do índice 0 até o tamanho do array -1 (ou seja, penúltimo elemento).
  for i in 0...(array.length - 1)
    # (i + 1)...(array.length) Ele significa: do índice 1 até o último elemento do array. 
    for j in (i + 1)...(array.length)
      # Se array[i] + array[j] for igual a target.
      if array[i] + array[j] == target
        # Deve retornar os índices.
        return [i, j]
      end
    end
  end
end

#testes
entry = [3, 2, 4]
target = 6

result = two_sum(entry, target)

puts result.inspect