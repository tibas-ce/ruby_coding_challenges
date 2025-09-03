# 🎯 Binary Search (Busca Binária)

Implementação do algoritmo de busca binária em Ruby, disponível nas versões iterativa e recursiva.

---

## 📖 Descrição

A busca binária é um algoritmo eficiente que encontra a posição de um valor em um array ordenado.  
O algoritmo compara o valor procurado com o elemento do meio do array e, baseado na comparação, elimina metade dos elementos restantes a cada iteração.

---

## ⚡ Complexidade

| Métrica      | Iterativa | Recursiva |
|-------------|-----------|-----------|
| Tempo       | O(log n)  | O(log n)  |
| Espaço      | O(1)      | O(log n)  |
| Melhor caso | O(1)      | O(1)      |
| Pior caso   | O(log n)  | O(log n)  |

---

## 📋 Pré-requisitos

- ✅ Array deve estar ordenado (crescente)  
- ✅ Elementos devem ser comparáveis (números, strings, etc.)  

---

## 🔧 Implementações

### iterativo.rb
- Usa loops `while`/`for`  
- Mais eficiente em memória: O(1)  
- Preferível para arrays muito grandes  
- Mais fácil de debugar  

### recursivo.rb
- Usa chamadas recursivas da função  
- Mais elegante e legível  
- Usa O(log n) de memória (stack)  
- Demonstra conceito de divisão e conquista  

---

## 📊 Exemplo de Funcionamento

```ruby
array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
target = 7

# Passo 1: meio = 5 (index 4), array[4] = 9
# 9 > 7, então busca na metade esquerda

# Passo 2: meio = 2 (index 2), array[2] = 5  
# 5 < 7, então busca na metade direita

# Passo 3: meio = 3 (index 3), array[3] = 7
# 7 == 7, encontrou! Retorna index 3

---

## 🧪 Como Testar

```bash
# Binary Search
cd pesquisa_binaria
ruby test_implementacao.rb

# Linear Search  
cd pesquisa_linear
ruby test_implementacao.rb

---

## 📈 Vantagens vs Desvantagens

**✅ Vantagens**  
- Extremamente rápida para arrays grandes  
- Previsível: sempre O(log n) comparações  
- Escalável: performance não degrada significativamente  
- Elegante: algoritmo matemático bem definido  

**❌ Desvantagens**  
- Requer ordenação: array deve estar sorted  
- Overhead: para arrays pequenos (<20 elementos) pode ser mais lenta que linear  
- Complexidade: mais difícil de implementar que busca linear  

---

## 🎯 Quando Usar

**✅ Use Binary Search quando:**  
- Array tem mais de 100 elementos  
- Dados já estão ordenados  
- Fará múltiplas buscas no mesmo dataset  
- Performance é crítica  
- Trabalhando com Big Data  

**❌ Evite quando:**  
- Array tem menos de 20 elementos  
- Dados não estão ordenados (custo de ordenar > benefício)  
- Fará apenas uma busca  
- Simplicidade é mais importante que performance

---

## 🔍 Variações Implementáveis

1. **First Occurrence (Primeira Ocorrência)**  
   Encontra a primeira posição de um elemento repetido.  
2. **Last Occurrence (Última Ocorrência)**  
   Encontra a última posição de um elemento repetido.  
3. **Lower Bound**  
   Encontra a primeira posição onde um elemento pode ser inserido.  
4. **Upper Bound**  
   Encontra a última posição onde um elemento pode ser inserido.  

---

## 💡 Casos de Teste Importantes

```ruby
# Casos básicos
[]                 # Array vazio
[5]                # Array com 1 elemento
[1, 2, 3, 4, 5]    # Array pequeno

# Casos extremos
target == primeiro_elemento
target == ultimo_elemento  
target == elemento_do_meio
target_nao_existe

# Casos especiais
array_com_duplicatas
array_muito_grande   # 1M+ elementos

---

## 🚀 Aplicações Reais

- Sistemas de busca: Google, bancos de dados  
- Games: pathfinding, collision detection  
- Matemática: encontrar raízes de funções  
- Algoritmos: componente de merge sort, quick sort  
- Data Science: análise de datasets ordenados  

---

## 🎓 Perguntas de Entrevista

### Básicas
- "Implemente binary search iterativa e recursiva"  
- "Qual a complexidade de tempo e espaço?"  
- "Por que o array precisa estar ordenado?"  

### Avançadas
- "Como modificar para encontrar a primeira ocorrência?"  
- "Como implementar em um array com duplicatas?"  
- "Quando binary search é pior que linear search?"  

### Pegadinhas
- "E se o array tem overflow de inteiros?" (usar `(low + high) / 2` pode dar overflow)  
- "Como implementar para arrays infinitos?"  

---

## 🔧 Dicas de Implementação

```ruby
# ❌ Pode causar overflow
mid = (low + high) / 2

# ✅ Mais seguro  
mid = low + (high - low) / 2

# ✅ Ruby não tem overflow de int, mas é boa prática
mid = (low + high) >> 1  # divisão por 2 com bit shift

---

## 💭 Filosofia do Algoritmo

*"Elimine metade das possibilidades a cada passo. O impossível se torna possível através da divisão inteligente do problema."*

