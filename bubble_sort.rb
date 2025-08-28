# Bubble sort (classificação por bolha) - Mais informações readme

lista_desordenada = [4, 1, 5, 2, 3, 9, 6, 8, 7]
lista_desordenada2 = [15, 12, 13, 14, 11, 16, 17, 18, 19]

# Imprimindo listas antes do uso do bubble_sort
puts("Listas desordenadas")
# O  método .inspect mostra o objeto Ruby cru. Assim, o array aparece exatamente como foi escrito no código, com colchetes e vírgulas.
puts lista_desordenada.inspect
puts lista_desordenada2.inspect

def bubble_sort (array)
    troca_ocorreu = true
    while troca_ocorreu == true
        troca_ocorreu = false
        # O o método .each_with_index é usado para iterar sobre uma coleção (array, hash, etc.) e, além do item atual, também fornecer o índice desse item.
        array.each_with_index do |item, i|
            # verifica se i e menor uqe o tamanho do array
            if i < array.length - 1
                # condição de troca
                if array[i] > array[i + 1]
                    # guardar o valor atual
                    auxiliar = array[i]
                    # troca o valor atual para o seguinte
                    array[i] = array[i + 1]
                    # troca o valor seguinte para valor atual
                    array[i + 1] = auxiliar
                    # condição de retorno ao loop principal
                    troca_ocorreu = true
                end
            end
        end
    end
end

# Testes
bubble_sort(lista_desordenada)
bubble_sort(lista_desordenada2)

#imprime listas organizadas
puts("Listas ordenadas")
puts lista_desordenada.inspect
puts lista_desordenada2.inspect