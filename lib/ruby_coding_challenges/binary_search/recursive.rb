# Pesquisa binária recursiva - mais informações no docs/binary_search.md

# Regra número um da pesquisa binária é: a lista onde você vai procurar precisa estar ordenada.

module RubyCodingChallenges
    module BinarySearch
      module Recursive
        # O método "wrapper" é uma função simples cuja única responsabilidade é chamar uma função mais complexa, fornecendo a ela os parâmetros iniciais corretos
        # No nosso caso essa função, traz mais clareza ao usuário. Pois ele não precisa se preocupar em sempre passar os marcadores a função mais complexa há pesquisa_binaria_recursiva
        def self.search(array, target)
            # marcadores de inicialização da função recursive_binary_search
            start = 0
            last = array.length - 1
            # Chamando a função recebendo todos os valores, marcadores diretamente da função chamando_pesquisa, e array e target vindos do usuário
            recursive_binary_search(array, target, start, last)
        end

        def self.recursive_binary_search(array, target, start, last)
            # Condição para caso os marcadores se cruzem, indica falha mostrando que alvo não é encontrado
            if start > last
                return nil
            end
            # Calculo do índice do meio
            middle = (start + last) / 2
            middle_index_value = array[middle]
            # Condição de parada caso o alvo seja encontrado
            if middle_index_value == target
                return middle 
            # Se o valor de middle_index_value for menor que alvo, a busca continua na métade superior 
            elsif middle_index_value < target
            return recursive_binary_search(array, target, middle + 1, last)
            # Se o valor de middle_index_value for maior que alvo, a busca continua na métade inferior
            else # middle_index_value > target
                return recursive_binary_search(array, target, start, middle - 1)
            end
        end
      end
      
    end
end
