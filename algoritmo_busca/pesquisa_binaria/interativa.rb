# Pesquisa binária interativa - mais informações no README

# Regra número um da pesquisa binária é: a lista onde você vai procurar precisa estar ordenada.
lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
lista_sem = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15]
alvo = 11
alvo_inicio = 2
alvo_meio = 8
alvo_fim = 14


def pesquisa_binaria_interativa (array, target)
    # Marcadores de inicio e fim
    # A pesquisa binária opera com os índices, não com os valores dos elementos
    marcador_inicio = 0
    # o .length é um método que retorna o tamanho (quantidade de elementos) de uma coleção como Array, String, Hash etc.
    marcador_fim = array.length - 1
    # Continua a busca enquanto o marcador inicio não ultrapassa o do fim
    while marcador_inicio <= marcador_fim
        #A divisão por 2 (/) em Ruby, com números inteiros, já arredonda para baixo, o que funciona perfeitamente para encontrar o índice central.
        meio = (marcador_inicio + marcador_fim) / 2
        # Variável para adicionar o valor do índice ao meio
        valor_ind_meio = array[meio]
        if valor_ind_meio == target
            return meio            
        elsif valor_ind_meio < target
            marcador_inicio = meio + 1
        else # meio > target
            marcador_fim = meio - 1
        end
    end
    # Se o loop terminar sem encontrar o alvo, retorna nil para indicar falha. (OBS. outra opção comum é retornar -1)
    return nil
end

# Testes
puts(pesquisa_binaria_interativa(lista, alvo))
puts(pesquisa_binaria_interativa(lista, alvo_inicio))
puts(pesquisa_binaria_interativa(lista, alvo_meio))
puts(pesquisa_binaria_interativa(lista, alvo_fim))
puts(pesquisa_binaria_interativa(lista_sem, alvo))