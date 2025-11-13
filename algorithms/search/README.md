# 🔍 Algoritmos de Busca

Esta seção contém implementações de algoritmos fundamentais de busca, essenciais para qualquer desenvolvedor compreender e dominar.

---

## 📚 Algoritmos Implementados

### Binary Search (Busca Binária)

- **Complexidade:** O(log n)  
- **Pré-requisito:** Array ordenado  
- **Implementações:** Iterativa e Recursiva  
- **Uso:** Ideal para arrays grandes e ordenados  

### Linear Search (Busca Linear)

- **Complexidade:** O(n)  
- **Pré-requisito:** Nenhum  
- **Implementação:** Iterativa  
- **Uso:** Arrays pequenos ou não ordenados  

### Find Future (Busca do Sucessor Temporal) 

- **Complexidade:** O(n) (Abordagem Ingênua) ou O(nlogn) + O(logn) por busca (Abordagem Eficiente)
- **Pré-requisito:** Array de strings de datas válidas.
- **Implementação:** Ingênua (Linear) e Eficiente (Pré-processamento + Binária)
- **Uso:** Encontrar o próximo evento no tempo a partir de uma data de consulta.

---

## 📊 Comparação de Performance

| Algoritmo       | Melhor Caso | Caso Médio | Pior Caso | Espaço | Pré-requisito         | Overhead em arrays pequenos |
|-----------------|------------|-----------|-----------|--------|----------------------|----------------------------|
| Linear Search   | O(1)       | O(n)      | O(n)      | O(1)   | Nenhum               | Baixo – mais eficiente     |
| Binary Search   | O(1)       | O(log n)  | O(log n)  | O(1)   | Array ordenado       | Alto – cálculo de índices e limites |
| Find Future (Ingênua)   | O(1)         | O(n)        | O(n)        | O(1)    | Datas válidas     | Médio                                      |
| Find Future (Eficiente) | O(log n)     | O(n log n)  | O(n log n)  | O(n)    | Datas válidas     | Alto                                       |

---

## 🎯 Quando Usar Cada Algoritmo

### Linear Search
- ✅ Arrays pequenos (< 100 elementos)  
- ✅ Dados não ordenados  
- ✅ Busca única ou poucas buscas  
- ✅ Implementação simples necessária  

### Binary Search
- ✅ Arrays grandes (> 1000 elementos)  
- ✅ Dados já ordenados  
- ✅ Múltiplas buscas no mesmo dataset  
- ✅ Performance crítica  

### Find Future (Busca do Sucessor Temporal)
- ✅ Ingênua: Datasets de datas pequenos ou que mudam frequentemente (evitando o custo de ordenação).
- ✅ Eficiente: Datasets de datas grandes e estáticos, onde são necessárias múltiplas buscas com alta performance.

---

## 🧪 Como Testar

Cada algoritmo possui seu arquivo de teste. Para executar:

```bash
# Binary Search
cd binary_search
ruby binary_search_test.rb

# Linear Search  
cd linear_search
ruby linear_search_test.rb

# Find Future
cd find_future
ruby find_future_test.rb
```

---

## 📖 Conceitos Fundamentais

### Busca Linear

Percorre sequencialmente cada elemento até encontrar o valor desejado ou chegar ao fim do array.

**Vantagens:**  
- Simples de implementar  
- Funciona com qualquer tipo de dados  
- Não requer pré-processamento  

**Desvantagens:**  
- Lenta para arrays grandes  
- Não aproveita ordenação dos dados  

---

### Busca Binária

Divide repetidamente o espaço de busca pela metade, comparando o elemento do meio com o valor procurado.

**Vantagens:**  
- Extremamente eficiente para arrays grandes  
- Complexidade logarítmica  
- Predictable performance  

**Desvantagens:**  
- Requer array ordenado  
- Mais complexa de implementar  
- Overhead para arrays muito pequenos  

### Busca do Sucessor Temporal

Busca o menor valor de data que é maior que a data de consulta. Ele ilustra o trade-off entre o custo de preparação e a velocidade de busca:

- Ingênua (O(n)): Não exige ordenação. Percorre linearmente o array em cada busca.

- Eficiente (O(logn)): Requer uma etapa inicial de ordenação (O(nlogn)), mas permite buscas subsequentes muito rápidas usando a Busca Binária Modificada.

**Vantagens:**
- Resolve um problema específico de busca temporal.
- A versão eficiente é ideal para datasets grandes e com muitas consultas.

**Desvantagens:**
- O parsing e a validação de datas adicionam um overhead significativo.
- A versão eficiente tem um alto custo inicial de O(nlogn).

---

## 🔬 Análise Prática

**Exemplo de Performance:**  
Para um array de 1.000.000 elementos:  
- Linear Search: até 1.000.000 comparações  
- Binary Search: máximo 20 comparações (log₂ 1.000.000 ≈ 20) 
- Find Future (Ingênua): até 1.000.000 iterações (mais parsing).
- Find Future (Eficiente): 20 iterações na busca, após um custo inicial de ≈20.000.000 iterações para ordenação. 

**Break-even Point:**  
Binary Search compensa a partir de aproximadamente 20-50 elementos, dependendo do número de buscas realizadas. A abordagem Find Future (Eficiente) compensa a partir de um certo número de buscas, onde o custo total da ordenação é superado pelo ganho de velocidade das consultas O(logn).

---

## 💡 Dicas de Entrevistas

**Perguntas Comuns:**  
- "Quando você usaria linear vs binary search?"  
- "Como modificaria binary search para encontrar a primeira/última ocorrência?"  
- "Qual a complexidade de espaço da versão recursiva?"
- "(Find Future) Explique o trade-off entre as abordagens Ingênua e Eficiente no contexto do custo total de tempo (preparação + busca)."  

**Pontos para Destacar:**  
- Trade-offs entre complexidade e pré-requisitos  
- Importância da ordenação para binary search  
- Análise de complexidade em diferentes cenários
- A Busca do Sucessor Temporal destaca a importância do pré-processamento para otimizar o tempo de consulta.
