# Count (contador) - Mais informações no READEM

def count (phrase)
  # Contadores
  count_uppercase = 0
  count_lowercase = 0
  count_number = 0
  count_special = 0
  
  # .each_char método para percorrer caracteres. No nosso caso phrase
  phrase.each_char do |char|
    # Usamos o range de letras ("A".."Z").include? para saber se é maiúscula
    if ("A".."Z").include?(char)
      # Contador de maiúsculas +1
      count_uppercase += 1
    # Usamos a mesma estrutura, mais agora para minúsculas  
    elsif ("a".."z").include?(char)
      # Contador de minúsculas +1
      count_lowercase += 1
    # Agora comparamos com números  
    elsif ("0".."9").include?(char)
      # Contador de números +1
      count_number += 1
    # Se chegou até aqui, e caractere especial 
    else
      count_special += 1
    end
  end
  
  # Imprimindo resultado
  result = "A frase: #{phrase}.\n Letras maiúsculas: #{count_uppercase}\n Letras minúsculas: #{count_lowercase}\n Números: #{count_number}\n Caracteres especiais: #{count_special}"

  return result 
end

# teste
phrase = "1jasdfjAJuioueAQ@#*(112)"

puts count(phrase)