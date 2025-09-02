# Pesquisa binária recursiva - mais informações no README

# Regra número um da pesquisa binária é: a lista onde você vai procurar precisa estar ordenada.
lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
lista_sem = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15]
alvo = 11
alvo_inicio = 2
alvo_meio = 8
alvo_fim = 14

def pesquisa_binaria_recursiva (array, target, start, fim)
    # Condição para caso os marcadores se cruzem, indica falha mostrando que alvo não é encontrado
    if start > fim
        return nil
    end
    # Calculo do índice do meio
    meio = (start + fim) / 2
    valor_ind_meio = array[meio]
    # Condição de parada caso o alvo seja encontrado
    if valor_ind_meio == target
        return meio 
    # Se o valor de valor_ind_meio for menor que alvo, a busca continua na métade superior 
    elsif valor_ind_meio < target
       return pesquisa_binaria_recursiva(array, target, meio + 1, fim)
    # Se o valor de valor_ind_meio for maior que alvo, a busca continua na métade inferior
    else # valor_ind_meio > target
        return pesquisa_binaria_recursiva(array, target, start, meio - 1)
    end
end

# O método "wrapper" é uma função simples cuja única responsabilidade é chamar uma função mais complexa, fornecendo a ela os parâmetros iniciais corretos
# No nosso caso essa função, traz mais clareza ao usuário. Pois ele não precisa se preocupar em sempre passar os marcadores a função mais complexa há pesquisa_binaria_recursiva
def chamando_pesquisa (array, target)
    # marcadores de inicialização da função pesquisa_binaria_recursiva
    inicio = 0
    fim = array.length - 1
    # Chamando a função recebendo todos os valores, marcadores diretamente da função chamando_pesquisa, e array e target vindos do usuário
    pesquisa_binaria_recursiva(array, target, inicio, fim)
end

# teste
puts(chamando_pesquisa(lista, alvo))
puts(chamando_pesquisa(lista, alvo_inicio))
puts(chamando_pesquisa(lista, alvo_meio))
puts(chamando_pesquisa(lista, alvo_fim))
puts(chamando_pesquisa(lista_sem, alvo))