# Minimum spanning (abrangência mínima) - Mais informações readme

# Gerenciar grupos de elementos que podem ser unidos, e responder perguntas do tipo: Estes dois elementos estão no mesmo grupo? 
# class Union_find contendo todos os seus métodos
class Union_find
  # Construtor: recebe quantos elementos teremos
  def initialize(size)
    # Cria um array, em que cada elemento começa em seu próprio grupo
    @parent = Array.new(size) {|i| i}
    # Usamos o rank para saber qual grupo têm o valor maior. Assim podemos unir conjuntos de forma eficiente.
    @rank = Array.new(size, 0)
  end

  
  #Método union: juntar dois grupos diferentes
  def union (x, y)
    root_x = find(x)      # grupo do primeiro elemento 
    root_y = find(y)      # grupo do segundo elemento
    # Se já fazem parte do mesmo grupo, não faça nada
    return if root_x == root_y
    # Agora escolhemos quem será o grupo pai, e usamos o rank para deixar as árvores equilibradas
    if @rank[root_x] < @rank[root_y]
      @parent[root_x] = root_y      # raiz menor aponta para maior
    elsif @rank[root_x] > @rank[root_y]
      @parent[root_y] = root_x  
    else
      # Se forem iguais, escolhemos um e aumentamos o rank dele
      @parent[root_y] = root_x
      @rank[root_x] += 1
    end
  end
  
  # Método connected?: Verifica se dois elementos estão no mesmo conjunto.
  def connected?(x, y)
    find(x) == find(y)
  end
  
  # Método find: encontrar o grupo de cada elemento
  # private é uma palavra-chave que impede que um método seja chamado por qualquer coisa de fora da classe. Ele só pode ser chamado por outros métodos dentro da mesma classe.
  private
  def find (x)
    # Se o grupo de x não for ele mesmo, então seguimos até achar
    if @parent[x] != x
      # Compressão de caminho. Em vez de deixar x apontando para o "grupo intermediário", fazemos ele apontar direto para o grupo final. Isso encurta os caminhos, tornando futuras chamadas de find mais rápidas.
      @parent[x] = find(@parent[x])
    end
    # Retornamos o grupo
    return @parent[x]
  end
end

# estrutura de dados para testes
estradas = [["A", "B", 300], ["C","D", 150], ["E", "F", 200]]

def minimum_spanning (array)
  array_MST = []

  # Mapeia os nomes dos nós para números.
  nodes = []
  array.each do |origin, destyni, weight|
    # Pega o array nodes. Faz a união com [origin, destyni]. Atualiza nodes para esse novo array sem duplicatas.
    nodes |= [origin, destyni]
  end

  # Cria um hash para mapear nomes para índices numéricos.
  node_map = {}
  nodes.each_with_index { |node, i| node_map[node] = i }

  # Cria a estrutura union find
  uf = Union_find.new(nodes.length)

  # Ordene as arestas pelo peso
  array_ordenado = array.sort do |a, b|
    a[2] <=> b[2]      
  end

  # Percorre array_ordenado pelas arestas
  array_ordenado.each do |edge|
    origin, destyni, weight = edge
    
    # Encontra os índices numéricos dos nós.
    origin_index = node_map[origin]
    destyni_index = node_map[destyni]
    
    # Passo 5: Use Union_find para verificar se os nós estão conectados.
    if !uf.connected?(origin_index, destyni_index)
      # Se não estiverem, adicione a aresta à MST e una os nós.
      array_MST << edge
      uf.union(origin_index, destyni_index)
    end
  end
  
  return array_MST
end


teste = minimum_spanning(estradas)
puts teste.inspect