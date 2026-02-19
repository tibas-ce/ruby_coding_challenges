# Pesquisa binária interativa - mais informações no docs/binary_search.md

module RubyCodingChallenges
    module BinarySearch
      module Iterative
        def self.search(array, target)
            # Marcadores de inicio e fim
            # A pesquisa binária opera com os índices, não com os valores dos elementos
            market_start = 0
            # o .length é um método que retorna o tamanho (quantidade de elementos) de uma coleção como Array, String, Hash etc.
            market_end = array.length - 1
            # Continua a busca enquanto o marcador inicio não ultrapassa o do fim
            while market_start <= market_end
                #A divisão por 2 (/) em Ruby, com números inteiros, já arredonda para baixo, o que funciona perfeitamente para encontrar o índice central.
                middle = (market_start + market_end) / 2
                # Variável para adicionar o valor do índice ao meio
                middle_index_value = array[middle]
                if middle_index_value == target
                    return middle            
                elsif middle_index_value < target
                    market_start = middle + 1
                else # meio > target
                    market_end = middle - 1
                end
            end
            # Se o loop terminar sem encontrar o alvo, retorna nil para indicar falha. (OBS. outra opção comum é retornar -1)
            return nil
        end
      end
      
    end
end
