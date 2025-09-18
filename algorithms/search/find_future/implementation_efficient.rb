# Find future (busca futuro) - Mais informações README
# Abordagem Eficiente: O objetivo é preparar o array primeiro para que as buscas individuais sejam muito mais rápidas.
require "date"
# require_relative → procura relativamente ao projeto atual no nosso caso buscamos a função binary_search_next
require_relative "./next_binary_recursive"

def find_future_efficient (array, consult_date)
  # Converte strings para objetos Date (ignora datas inválidas)
  array = array.map do |d| 
    begin
      date = Date.strptime(d, "%d/%m/%Y")
      # Limita o intervalo de anos 0.. 9999
      date.year.between?(0, 9999) ? date : nil
    rescue Date::Error
      nil
    end  
  end  

  # Ordena as datas para garantir que a busca binária funcione corretamente
  # .compact remove nils
  array = array.compact.sort!

  # Converte a data consultada
  consult_date = Date.strptime(consult_date, "%d/%m/%Y")

  # Busca índice da primeira data maior ou igual à consult_date
  index = binary_search_next(array, consult_date)

  # Se consult_date existir no array, retornamos ela. Se não retorna a data encontrada ou nil se não houver futura
  if array.include?(consult_date)
    consult_date
  elsif index && index < array.length
    array[index]
  else
    nil
  end

end

# testes

arr = ["22/4/1233", "1/3/633", "23/5/56645"]

dc = "1/1/1000"

result = find_future_efficient(arr, dc)

puts result.inspect