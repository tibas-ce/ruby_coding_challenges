# Counting sort (Classificação por contagem) - Mais informações no README

# listas para contagem
lista = [3, 2, 4, 4, 1, 2, 3, 5, 1, 3]

# função de classificação por contagem
def counting_sort (array)
    # O array.empty? e método que retorna true se o array não tem elementos. Se o array é vazio, você já retorna [] sem tentar processar nada.
    return [] if array.empty?
    # .first serve para pegar o primeiro elemento de um array
    maior_valor = array.first

    # buscando maior valor do array
    array.each do |i|
        # compara o número atual com maior_valor, se número atual for maior que maior_valor, maior_valor se torna o número atual.
        if i > maior_valor
            maior_valor = i
        end
    end

    # criando array de contagem, que será o tamanho do maior_valor + 1
    # O método Array.new(tamanho, valor) cria um array com tamanho e valor pré-definidos
    contagem = Array.new(maior_valor + 1, 0)
    # percorre cada número da lista
    array.each do |item|
        # adiciona quantas vezes o número se repete na lista há lista contagem
        contagem[item] += 1
    end
    # transforma o array de contagem em um array de posições. cada índice agora armazena a soma cumulativa dos elementos.
    (1..maior_valor).each do |i|
        contagem[i] += contagem[i - 1]
    end

    # cria o array de saída e preenche com os elementos ordenados.
    saida = Array.new(array.length)
    # percorre o array original de trás para frente para garantir a estabilidade.
    array.reverse_each do |item|
        # encontra a posição correta do item no array de saída
        posicao = contagem[item] - 1
        saida[posicao] = item

        # decrementa a contagem para o próximo elemento de mesmo valor.
        contagem[item] -= 1
    end
    
    # retorna o array ordenado.
    return saida
end

# teste
resposta = counting_sort(lista)

puts("Lista números")
puts lista.inspect
puts("Lista quantas vezes cada número se repete em lista números")
puts resposta.inspect
