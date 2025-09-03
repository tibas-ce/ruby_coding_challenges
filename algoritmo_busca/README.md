🔍 Algoritmos de Busca
Esta seção contém implementações de algoritmos fundamentais de busca, essenciais para qualquer desenvolvedor compreender e dominar.

📚 Algoritmos Implementados
Binary Search (Busca Binária)

Complexidade: O(log n)
Pré-requisito: Array ordenado
Implementações: Iterativa e Recursiva
Uso: Ideal para arrays grandes e ordenados

Linear Search (Busca Linear)

Complexidade: O(n)
Pré-requisito: Nenhum
Implementação: Iterativa
Uso: Arrays pequenos ou não ordenados

📊 Comparação de Performance
| Algoritmo       | Melhor Caso | Caso Médio | Pior Caso | Espaço | Pré-requisito         | Overhead em arrays pequenos |
|-----------------|------------|-----------|-----------|--------|----------------------|----------------------------|
| Linear Search   | O(1)       | O(n)      | O(n)      | O(1)   | Nenhum               | Baixo – mais eficiente     |
| Binary Search   | O(1)       | O(log n)  | O(log n)  | O(1)   | Array ordenado       | Alto – cálculo de índices e limites |

🎯 Quando Usar Cada Algoritmo
Linear Search

✅ Arrays pequenos (< 100 elementos)
✅ Dados não ordenados
✅ Busca única ou poucas buscas
✅ Implementação simples necessária

Binary Search

✅ Arrays grandes (> 1000 elementos)
✅ Dados já ordenados
✅ Múltiplas buscas no mesmo dataset
✅ Performance crítica

🧪 Como Testar
Cada algoritmo possui seu arquivo de teste. Para executar:
bash

# Binary Search
cd pesquisa_binaria
ruby test_implementacao.rb

# Linear Search  
cd pesquisa_linear
ruby test_implementacao.rb

📖 Conceitos Fundamentais
Busca Linear
Percorre sequencialmente cada elemento até encontrar o valor desejado ou chegar ao fim do array.
Vantagens:

Simples de implementar
Funciona com qualquer tipo de dados
Não requer pré-processamento

Desvantagens:

Lenta para arrays grandes
Não aproveita ordenação dos dados

Busca Binária
Divide repetidamente o espaço de busca pela metade, comparando o elemento do meio com o valor procurado.
Vantagens:

Extremamente eficiente para arrays grandes
Complexidade logarítmica
Predictable performance

Desvantagens:

Requer array ordenado
Mais complexa de implementar
Overhead para arrays muito pequenos

🔬 Análise Prática
Exemplo de Performance
Para um array de 1.000.000 elementos:

Linear Search: Até 1.000.000 comparações
Binary Search: Máximo 20 comparações (log₂ 1.000.000 ≈ 20)

Break-even Point
Binary Search compensa a partir de aproximadamente 20-50 elementos, dependendo do número de buscas realizadas.

💡 Dicas de Entrevistas
Perguntas Comuns:

"Quando você usaria linear vs binary search?"
"Como modificaria binary search para encontrar a primeira/última ocorrência?"
"Qual a complexidade de espaço da versão recursiva?"

Pontos para Destacar:

Trade-offs entre complexidade e pré-requisitos
Importância da ordenação para binary search
Análise de complexidade em diferentes cenários