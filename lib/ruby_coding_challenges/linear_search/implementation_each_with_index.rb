# Linear search (busca linear) - Mais informações docs/Linear_search.md

module RubyCodingChallenges
    module LinearSearch
      module EachWithIndex
        # Versão usando .each_with_index (mais idiomática, dispensa variável de índice manual)
        def self.search(array, target)
          array.each_with_index do |amount, index|
            return index if amount == target
          end
          return -1
        end
      end
    end
end
