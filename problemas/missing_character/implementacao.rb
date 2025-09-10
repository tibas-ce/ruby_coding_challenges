# Missing character (personagem ausente) - Mais informações no README

# Set é uma coleção sem duplicatas. Ele vem da biblioteca padrão do Ruby (require 'set').Internamente funciona parecido com um hash → buscas, inserções e exclusões são rápidas.
require "set"

def missing_character (phrase)
  # notes é um Set. Ele é otimizado para armazenar itens únicos e é extremamente rápido para verificar se algo já está lá.
  notes = Set.new([])

  # Transformando frase em minuscúlas.
  phrase = phrase.downcase

  # O .chars transforma a string em array de caracteres.
  # Dica: use .each_char quando for somente percorrer caracteres e .chars quando quiser trabalhar com array de caracteres (por exemplo, usar métodos de array depois).
  phrase.chars.each do |letter|

    # Isso é uma expressão regular c[A-Za-z] pega apenas letras latinas simples.
    # No nosso caso verificando se é uma letra.
    if letter.match?(/[A-Za-z]/)
      # Se for, adiciona a notes
      notes << letter
    end
  end

  # Cria array de ausentes.
  absent = []
  # ("a".."z") cria um range de caracteres de "a" até "z". O .each percorre cada letra desse range.
  ("a".."z").each do |letter|
    # notes.include?(letter) verifica se a letra atual já existe no array notes.unless significa “a não ser que” (o contrário de if). Adicione a letter no array absent, a não ser que ela já esteja no array letras.
    absent << letter unless notes.include?(letter)
  end
  
  return absent
end

# teste
frase = "A cada volta do laço, a variável letra recebe uma letra do alfabeto."

resposta = missing_character(frase)

puts resposta.inspect