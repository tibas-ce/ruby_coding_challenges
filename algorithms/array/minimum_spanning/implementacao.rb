# Minimum spanning (abrangência mínima) - Mais informações readme
# Chamando a class Union_find
require_relative "union_find"

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

# teste
# estrutura de dados para testes
estradas = [["A", "B", 300], ["C","D", 150], ["E", "F", 200]]
teste = minimum_spanning(estradas)
puts teste.inspect