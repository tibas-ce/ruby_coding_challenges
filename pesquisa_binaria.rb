# Pesquisa binária - mais informações no README

# Regra número um da pesquisa binária é: a lista onde você vai procurar precisa estar ordenada.
lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
lista_sem = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15]
alvo = 13


def pesquisa_binaria (array, target)
    # Marcadores de inicio e fim
    # O .first retorna o primeiro (obs. poderiamos colocar o 0, pois o índice sempre inicia em 0)
    marcador_inicio = array.first
    # o .length é um método que retorna o tamanho (quantidade de elementos) de uma coleção como Array, String, Hash etc.
    marcador_fim = array.length - 1
    while marcador_inicio <= marcador_fim
        meio = (marcador_inicio + marcador_fim) / 2
        if meio == target
            # O .index() procura onde um valor aparece e retorna a posição (ou nil se não existir).
            meio = array.index(meio)
            return meio            
        elsif meio < target
            marcador_inicio = meio + 1
        elsif meio > target
            marcador_fim = meio - 1
        end
    end
    return nil
end

puts(pesquisa_binaria(lista, alvo))
puts(pesquisa_binaria(lista_sem, alvo))