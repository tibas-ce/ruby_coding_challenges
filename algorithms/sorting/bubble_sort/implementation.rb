# Bubble sort (classificação por bolha) - Mais informações readme

def bubble_sort (array)
    exchange_occurred = true
    while exchange_occurred == true
        exchange_occurred = false
        # O o método .each_with_index é usado para iterar sobre uma coleção (array, hash, etc.) e, além do item atual, também fornecer o índice desse item.
        array.each_with_index do |item, i|
            # verifica se i e menor uqe o tamanho do array
            if i < array.length - 1
                # condição de troca
                if array[i] > array[i + 1]
                    # guardar o valor atual
                    assistant = array[i]
                    # troca o valor atual para o seguinte
                    array[i] = array[i + 1]
                    # troca o valor seguinte para valor atual
                    array[i + 1] = assistant
                    # condição de retorno ao loop principal
                    exchange_occurred = true
                end
            end
        end
    end
    return array
end
