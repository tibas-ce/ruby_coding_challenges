# Find future (busca futuro) - Mais informações README
# Abordagem Ingênua: O objetivo é percorrer o array de datas uma vez, comparando cada data com a sua data de consulta.
# Carrega a biblioteca de datas
require "date"

# Função que limita as datas ao intervalo passado no nosso caso 0 a 9999
def valid_date?(date)
  # O date.year: date é um objeto da classe Date. .year retorna o ano da data como um número inteiro.
  date.year.between?(0, 9999)
end

def find_future_naive (array, consult_date)
  # Tratamento de dados. O .parse transforma em dates com a biblioteca date
  consult_date = Date.parse(consult_date)
  # Ruby não tem um Date::Infinity, mas podemos simular: basta usar nil e tratar, ou então usar uma data sentinela bem distante (9999-12-31)
  future_date = Date.new(9999, 12, 31)

  array.each do |date_str|
    # Se a string estiver vazia ou nil, pula
    next if date_str.nil? || date_str.strip.empty?

    # Converte string para data
    current_date = Date.parse(date_str)
  
    # Se a date for posterior à sua consul_date e se ela for anterior à future_date atual. 
    if valid_date?(current_date) && current_date > consult_date && current_date < future_date
      # Atualiza future_date
      future_date = current_date
    end
  # Ignora datas inválidas (acima de 9999)
  rescue ArgumentError
  end

  # Se future_date for menor que consult_date
  if future_date < consult_date
    # Retorne -1
    return -1
  else
    return future_date
  end 
end

#teste
dates = ["22/4/1233", "1/3/633", "23/5/56645"]
consult_date = "1/1/1000"

resultado = find_future_naive(dates, consult_date)

puts resultado.inspect