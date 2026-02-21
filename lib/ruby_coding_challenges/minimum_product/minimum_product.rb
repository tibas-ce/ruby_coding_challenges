# Minimum product (produto minimo) - Mais informações readme

module RubyCodingChallenges
  module MinimumProduct
    def self.search(array)
      # Seleciona todos os negativos para contar e encontrar o maior. O .select cria um novo array so com negativos
      negatives = array.select {|n| n < 0}
      # O método .count verifica a quantidade de zeros no array
      zeros = array.count {|n| n == 0}
      # Pega o menor número positivo caso não aja negativos ou zeros
      minor_positive = array.select {|n| n > 0}.min
  
      # Caso 1 - Array não tem negativos nem zeros, o produto mínimo é o menor número positivo.  
      if negatives.empty?
        # Caso 2: Se há pelo menos um zero. A resposta é 0. O zero zera qualquer produto.
        return 0 if zeros > 0
        # Se não houver zeros nem negativos, o produto é o menor positivo.
        return minor_positive
      end
      
      # Passo 3: O caso principal - há apenas números negativos e positivos.
      # Calculamos o produto total.
      total_product = array.inject(1) { |acc, n| acc * n }
      # Se o número de negativos for ímpar, o produto total já é o mínimo.
      if negatives.size.odd?
        return total_product
      end 
      # Se não houver zeros, significa que temos um número par de negativos. Para obter o produto mínimo, removemos o maior negativo.
      biggest_negative = negatives.max
      # Para torná-lo mínimo (negativo), dividimos pelo negativo mais próximo de zero. Isso é o mesmo que remover esse número da multiplicação.
      return total_product / biggest_negative
    end
  end
end
