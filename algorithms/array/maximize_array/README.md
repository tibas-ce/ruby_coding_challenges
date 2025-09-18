# 🎯 Maximize Array (Maximizar Array)

Implementação de algoritmo para maximizar a soma de um array através de inversões estratégicas de sinais.

## 📖 Descrição

O algoritmo Maximize Array resolve o problema de maximizar a soma de um array quando você tem um número limitado de operações de inversão de sinal. O objetivo é usar essas inversões de forma inteligente para transformar números negativos em positivos e obter a maior soma possível.

A implementação utiliza **estratégia gulosa otimizada**:
1. **Primeiro**: inverte todos os números negativos (prioridade máxima)
2. **Segundo**: se sobraram inversões ímpares, inverte o menor número absoluto
3. **Resultado**: soma total maximizada

## ⚡ Complexidade

| Métrica | Complexidade | Descrição |
|---------|-------------|-----------|
| **Tempo** | O(n log n) | Dominado pela ordenação inicial |
| **Espaço** | O(1) | Modifica array in-place após ordenação |
| **Operações** | O(n) | Inversões lineares após ordenação |

## 🔧 Implementação

### `implementation.rb`
**Função: `maximize_array(array, turn)`**

#### **Características da Implementação:**
- **Estratégia gulosa**: prioriza inversão de números negativos
- **Ordenação inteligente**: facilita processamento sequencial
- **Otimização de sobras**: trata inversões restantes de forma ótima
- **Ruby idiomático**: usa `sort`, `each_with_index`, `odd?`, `min`, `sum`

#### **Lógica Implementada:**
1. **Ordenação**: `array.sort` organiza do menor para o maior
2. **Inversão de negativos**: percorre sequencialmente invertendo negativos
3. **Controle de inversões**: decrementa `turn` a cada uso
4. **Tratamento de sobras**: se `turn.odd?`, inverte o menor absoluto
5. **Soma final**: `array_ordered.sum` retorna resultado maximizado

## 📊 Exemplo de Funcionamento

### Caso 1: Inversões suficientes para todos os negativos
```ruby
array = [-3, 1, -2, 4]
turn = 3

# Passo 1: Ordenação
# [-3, 1, -2, 4] → [-3, -2, 1, 4]

# Passo 2: Inversão de negativos
# Index 0: -3 < 0 && turn=3 > 0 → array[0] = 3, turn = 2
# Index 1: -2 < 0 && turn=2 > 0 → array[1] = 2, turn = 1  
# Index 2: 1 >= 0 → pula
# Index 3: 4 >= 0 → pula
# Array atual: [3, 2, 1, 4]

# Passo 3: Verificação de sobras
# turn = 1 é ímpar? ✅ Sim
# Menor valor: min([3, 2, 1, 4]) = 1 (index 2)
# array[2] = -1
# Array final: [3, 2, -1, 4]

# Passo 4: Soma
# 3 + 2 + (-1) + 4 = 8
```

### Caso 2: Inversões insuficientes
```ruby
array = [-5, -3, -1, 2]
turn = 2

# Passo 1: Ordenação  
# [-5, -3, -1, 2] (já ordenado)

# Passo 2: Inversão de negativos
# Index 0: -5 < 0 && turn=2 > 0 → array[0] = 5, turn = 1
# Index 1: -3 < 0 && turn=1 > 0 → array[1] = 3, turn = 0
# Index 2: -1 < 0 && turn=0 = 0 → pula (sem inversões restantes)
# Array atual: [5, 3, -1, 2]

# Passo 3: Verificação de sobras
# turn = 0 é ímpar? ❌ Não
# Nenhuma inversão adicional

# Passo 4: Soma
# 5 + 3 + (-1) + 2 = 9
```

### Caso 3: Todos positivos com inversões ímpares
```ruby
array = [1, 2, 3, 4]
turn = 5

# Passo 1: Ordenação
# [1, 2, 3, 4] (já ordenado)

# Passo 2: Inversão de negativos
# Nenhum número negativo, turn permanece 5

# Passo 3: Verificação de sobras  
# turn = 5 é ímpar? ✅ Sim
# Menor valor: min([1, 2, 3, 4]) = 1 (index 0)
# array[0] = -1
# Array final: [-1, 2, 3, 4]

# Passo 4: Soma
# (-1) + 2 + 3 + 4 = 8
```

## 🧪 Como Usar

```bash
# Executar implementação
ruby implementation.rb

# Executar testes
ruby maximize_array_test.rb
```

## 📈 Vantagens vs Desvantagens

### ✅ Vantagens
- **Estratégia ótima**: algoritmo guloso garante resultado máximo
- **Eficiência**: O(n log n) é razoável para maioria dos casos
- **Simplicidade**: lógica clara e direta
- **Robustez**: trata todos os casos extremos corretamente
- **Ruby idiomático**: aproveita métodos nativos elegantes

### ❌ Desvantagens
- **Ordenação necessária**: O(n log n) pode ser overhead para arrays pequenos
- **Modifica ordem**: altera ordem original do array
- **Não in-place real**: cria nova cópia ordenada

## 🎯 Quando Usar

### ✅ Use este algoritmo quando:
- **Maximização de soma** com inversões limitadas
- **Problemas de otimização** discreta
- **Jogos e competições** de programação
- **Análise financeira** (converter perdas em ganhos)
- **Problemas de balanceamento** de sinais

### ✅ Cenários práticos:
- **Trading algorithms**: maximizar retorno com operações limitadas
- **Game theory**: otimizar pontuação com movimentos limitados
- **Resource allocation**: balancear custos/benefícios
- **Signal processing**: correção de polaridade

## 🔍 Análise Técnica da Sua Implementação

### 🎯 Pontos Fortes do Seu Código:

```ruby
# ✅ Ordenação estratégica
array_ordered = array.sort

# ✅ Iteração eficiente com controle
array_ordered.each_with_index do |num, index|
  if num < 0 && tunr > 0

# ✅ Inversão in-place
array_ordered[index] = - num

# ✅ Controle preciso de inversões
tunr = tunr - 1

# ✅ Verificação de paridade elegante
if tunr.odd?

# ✅ Busca do menor valor
small_num = array_ordered.index(array_ordered.min)

# ✅ Inversão estratégica final
array_ordered[small_num] = - array_ordered[small_num]

# ✅ Soma idiomática
mazimize_sum = array_ordered.sum
```

### 📊 Análise de Qualidade:

| Aspecto | Nota | Comentário |
|---------|------|------------|
| **Algoritmo** | ⭐⭐⭐⭐⭐ | Estratégia gulosa ótima |
| **Implementação** | ⭐⭐⭐⭐⭐ | Código limpo e correto |
| **Ruby Style** | ⭐⭐⭐⭐⭐ | Excelente uso de métodos nativos |
| **Eficiência** | ⭐⭐⭐⭐ | O(n log n) é adequado |
| **Legibilidade** | ⭐⭐⭐⭐⭐ | Lógica clara e bem estruturada |

### 🎯 Insights Algorítmicos:

**Por que sua estratégia é ótima:**
1. **Prioridade correta**: negativos sempre geram mais valor quando invertidos
2. **Ordenação inteligente**: facilita processamento sequencial
3. **Tratamento de sobras**: inversões ímpares são otimizadas
4. **Decisão gulosa**: cada escolha é localmente e globalmente ótima

## 🚀 Aplicações e Contexto

### Problemas Relacionados
- **Maximum Subarray** (com modificações permitidas)
- **Stock Buy/Sell** com transações limitadas  
- **Game Theory** - maximização de score
- **Portfolio Optimization** - hedge de posições
- **Signal Correction** - inversão de polaridades

### Variações do Problema
- **Maximize Product**: mesmo conceito com multiplicação
- **Minimize Sum**: versão dual (minimizar ao invés de maximizar)
- **K-Limited Operations**: extensão com múltiplos tipos de operação
- **Weighted Array**: elementos com pesos diferentes

## 🔄 Complexidade vs Alternativas

| Abordagem | Tempo | Espaço | Complexidade Implementação |
|-----------|-------|--------|---------------------------|
| **Sua solução (Gulosa)** | O(n log n) | O(1) | ⭐⭐⭐ |
| **Força bruta** | O(2^n × n) | O(n) | ⭐ |
| **DP com bitmask** | O(n × 2^turn) | O(n × 2^turn) | ⭐⭐⭐⭐⭐ |
| **Greedy sem sort** | O(n × turn) | O(1) | ⭐⭐ |

## 🎓 Perguntas de Entrevista

### Básicas
- "Maximize array sum with limited sign flips"
- "Por que ordenar o array primeiro?"
- "Como tratar inversões restantes ímpares?"

### Intermediárias
- "Prove que a estratégia gulosa é ótima"
- "E se você pudesse fazer inversões parciais?"
- "Como modificar para minimizar ao invés de maximizar?"

### Avançadas
- "Versão online onde elementos chegam sequencialmente"
- "E se inversões tivessem custos diferentes?"
- "Como adaptar para matrizes 2D?"

### Pegadinhas
- "E se turn = 0?" (retorna soma original)
- "E se todos os números forem positivos e turn ímpar?" (inverte menor)
- "Performance com array já ordenado?" (ainda O(n log n) por sort)

---

**💭 Filosofia do Algoritmo:**
> "A sabedoria está em saber quando agir e quando parar. Maximize Array nos ensina que a ganância inteligente - priorizar os maiores ganhos primeiro - leva à solução ótima."

**🎯 Lição Principal:**
Este algoritmo exemplifica perfeitamente uma **estratégia gulosa ótima**. Nem todos os problemas podem ser resolvidos com gulosa, mas quando podem, a elegância e eficiência são notáveis. A chave é reconhecer que inverter um número negativo sempre gera mais valor que inverter um positivo de mesmo módulo.