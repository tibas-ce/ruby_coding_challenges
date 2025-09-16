# Precisamos de uma busca binária que retorne o índice da primeira data maior que o target, mesmo que não exista correspondência exata. A busca binária que estar no algoritmo_busca só retorna índices quando encontra exatamente o valor (valor_ind_meio == target).

def recursive_binary_search_next(array, target, start, fim)
  return nil if start > fim

  mean = (start + fim) / 2
  mean_value = array[mean]

  if mean_value <= target
    recursive_binary_search_next(array, target, mean + 1, fim)
  else
    # tenta buscar um índice menor que também seja maior que target
    possible = recursive_binary_search_next(array, target, start, mean - 1)
    possible.nil? ? mean : possible
  end
end

def binary_search_next(array, target)
  recursive_binary_search_next(array, target, 0, array.length - 1)
end
