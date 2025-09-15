# Calculate age (calcular idade) - Mais informações no README
# Este método calcula a idade em dias, meses e anos de forma manual, replicando a lógica  de "empréstimo" de dias e meses. A intenção é servir como um exercício de lógica para entender os fundamentos do cálculo de idade, incluindo anos bissextos e meses de diferentes durações. Para uso em aplicações reais, a prática recomendada é utilizar bibliotecas prontas (como a classe Date de Ruby) que já lidam com essas complexidades de forma confiável e eficiente.

require_relative "auxiliary_function"

# método que aceita string "DD-MM-YYYY" ou três inteiros e retorna [dias, meses, ano]
def calculate_age_manual (entry1, entry2 = nil, entry3 = nil)
  # se recebeu uma string "DD-MM-YYYY", faz parse para inteiros
  if entry2.nil? && entry3.nil?
    # separa a string em ano, mês e dia
    day, month, year = entry1.split("-").map(&:to_i)
  else
    # recebeu já os três inteiros
    day, month, year = entry1, entry2, entry3
  end

  # O Time.now retorna a data e hora atuais do sistema em um objeto, no fuso horário local.
  # pega data atual usando Time
  today = Time.now
  today_day = today.day               # dia atual
  today_month = today.month           # mês atual
  today_year = today.year             # ano atual

  # valida se data de nascimento não está no futuro (comparação por tupla).Se (ano, mês, dia) > (ano_atual, mês_atual, dia_atual) significa que a data de nascimento está no futuro, lança um erro.
  if year > today_year || (year == today_year && month > today_month) || (year == today_year && month == today_month && day > today_day)
    raise ArgumentError, "Data de nascimento no futuro"
  end

  days = today_day - day               # diferença inicial de anos
  months = today_month - month         # diferença inicial de meses
  years = today_year - year            # diferença inicial de dias

  # se dias for negativo, emprestamos dias do mês anterior ao mês atual
  if days < 0
    prev_month = today_month - 1       # calcula mês anterior relativo a hoje
    prev_year = today_year             # assume mesmo ano
    if prev_month == 0                 # se mês anterior é zero, volta ao ano anterior
      prev_month = 12
      prev_year -= 1
    end
    days += days_month(prev_year, prev_month)     # soma os dias do mês anterior
    months-= 1                                    # pegamos dias do mês anterior -> reduz um mês
  end

  # se meses ficou negativo, ajusta anos
  if months < 0
    months += 12                              # converte para valor positivo (ex.: -2 => 10)
    years -= 1                                # reduz um ano pois emprestamos 12 months
  end

  [days, months, years]                       # retorna Array com years, months e dias
end

# testes
string = "07-07-1987"
day = 7
month = 7
year = 1987

result = calculate_age_manual(string)
result2 = calculate_age_manual(day, month, year)

puts result.inspect
puts result2.inspect