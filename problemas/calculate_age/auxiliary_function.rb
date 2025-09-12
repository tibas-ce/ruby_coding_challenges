# Funções que são usadas no caso de dias negativos.
# leap_year?(year) → serve só para ajudar dias_no_mes a saber se fevereiro tem 28 ou 29 
# days_month (year, month) → é usada no ajuste de dias quando dias < 0.

def leap_year?(year)
  # Regras do ano bissexto:
  # Um ano é bissexto se:
  # É divisível por 4 e não é divisível por 100: year % 4 == 0 && 100 != 0
  # OU
  # É divisível por 400(exceção: séculos divisíveis por 400 continuam sendo bissextos.): year % 400 == 0
  (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
end

def days_month (year, month)
  # Mês com 31 dias
  case month 
  when 1, 3, 5, 7, 8, 10, 12
    return 31
   # Mês com 30 dias
  when 4, 6, 9, 11
    return 30
  when 2
    # Fevereiro depende de ano bissexto 
    if leap_year?(year)
      # Se for 
      return 29
    # Se não
    else
      return 28
    end
  else
    raise ArgumentError, "Mês inválido: #{month}"
  end
end