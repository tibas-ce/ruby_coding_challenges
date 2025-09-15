# versão usando a biblioteca Date do Ruby

# Carrega a biblioteca Date do ruby
require "date"

# método que recebe birth (Date ou string "YYYY-MM-DD") e retorna [anos, meses, dias]
def calculate_age_with_date (birth)
  # Pega data do dia
  today = Date.today
  # converte string para Date se necessário
  if birth.is_a?(String)
    birth = Date.parse(birth)
  else
    birth
  end

  # evita datas futuras
  if birth > today
    raise ArgumentError, "Data de nascimento no futuro"
  end

  years = today.year - birth.year          # diferença simples de anos
  months = today.month - birth.month       # diferença simples de meses
  days = today.day - birth.day             # diferença simples de dias
  
  # se o valor de dias for negativo, precisamos "pegar emprestado" dias do mês anterior
  if days < 0
    # pega o último dia do mês anterior: primeiro dia do mês atual menos 1 dia
    last_day_prev_monyh = (Date.new(today.year, today.month, 1) - 1).day
    # Soma os dias do Mẽs anterior ao dias negativos
    days += last_day_prev_monyh
    # como pegamos dias do mês anterior, subtrai 1 mês
    months -= 1
  end

  # Se meses ficar negativo, faz o ajuste de anos
  if months < 0
    # Converte meses negativos para positivo (ex.: -2 => 10)
    months += 12
    # Reduz um ano porque emprestamos 12 meses
    years -= 1
  end

  # Retorna um array com anos, meses e dias
  [years, months, days]
end

# teste
nacimento = "1991-08-30"
# Chama o método e desempacota o resultado
y, m, d = calculate_age_with_date(nacimento)

puts "Idade: #{y} anos, #{m} meses e #{d} dias."