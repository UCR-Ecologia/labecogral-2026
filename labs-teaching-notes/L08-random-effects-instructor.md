# Laboratorio 08: efectos aleatorios — guía para la persona instructora

## Logística de las estaciones

Para imprimir:

- **Por grupo (1 copia):** páginas 1–2 (introducción, actividad, sintaxis,
  tabla de referencia) y páginas 7–8 (hoja de trabajo). La última página (caso de
  bitácora) también va por grupo, o se proyecta al final.
- **Por estación (2 copias de cada caso):** páginas 3–6, una página por caso.
  Ocho estaciones en total.

Tiempos sugeridos: 4 rotaciones × 5–6 min ≈ 22–24 min; cierre en grupo 10 min;
puesta en común 10–15 min. Total ≈ 45–50 min, más el caso de bitácora si se
resuelve en clase.

En la rotación conviene que cada grupo empiece en un caso distinto para que las
ocho estaciones estén ocupadas desde el inicio. Con más de ocho grupos, un tercer
juego de copias.

## Respuestas sugeridas

### Caso 1. Muestreo anidado

**Estructura sugerida:** interceptos aleatorios para sitio y parcela dentro de
sitio, por ejemplo:

```text
crecimiento ~ tratamiento + (1 | sitio/parcela)
```

Las plántulas de una misma parcela comparten condiciones locales y las parcelas
están anidadas en sitios. El tratamiento se asigna dentro de las parcelas.

**Dentro o entre grupos:** el tratamiento se compara *dentro* de cada parcela.
Si se omite el agrupamiento, la varianza de sitio y de parcela queda en el
residuo y el intervalo del efecto del tratamiento sale **demasiado amplio**
(conservador). No es pseudorreplicación; se pierde precisión.

### Caso 2. Medidas repetidas

**Estructura sugerida:** intercepto aleatorio para plántula; una pendiente
aleatoria de tiempo puede ser apropiada si el diseño y los datos la respaldan:

```text
altura ~ tratamiento * semana + (1 + semana | plantula)
```

Las mediciones semanales de una plántula no son independientes. La interacción
tratamiento por semana estima la diferencia en tasa de crecimiento entre
tratamientos.

Cómo conectar con la pregunta "Conversen" del caso: *altura inicial distinta* →
intercepto aleatorio `(1 | plantula)`; *tasa distinta entre plántulas* →
pendiente aleatoria `(semana | plantula)`. El mínimo razonable es
`(1 | plantula)`; la pendiente aleatoria reconoce que la variación entre
plántulas en su tasa es la variación relevante para comparar tratamientos.
Conviene que `semana` empiece en 0 para que el intercepto sea la altura inicial.

Alternativa válida que algunos grupos propondrán: calcular la pendiente de cada
plántula (8 puntos → 1 tasa) y comparar las 30 tasas con un modelo lineal simple
o una prueba t. Es un análisis en dos etapas que estima lo mismo y deja claro que
el n efectivo para el tratamiento es 30, no 240.

**Dentro o entre grupos:** el tratamiento se compara *entre* plántulas (cada
plántula recibe un solo tratamiento). Si se omite el agrupamiento, las ocho
mediciones de cada plántula se tratan como réplicas independientes del efecto del
tratamiento: pseudorreplicación, intervalo **demasiado estrecho**.

### Caso 3. Diseño en bloques

**Estructura sugerida:** intercepto aleatorio para bloque:

```text
crecimiento ~ tratamiento + (1 | bloque)
```

Las parcelas de un mismo bloque comparten humedad y condiciones de base, y la
comparación de tratamientos se hace dentro de cada bloque. Con solo 10 bloques,
también puede ser defendible tratar bloque como efecto fijo si la inferencia se
limita a esos bloques específicos. Con dos parcelas por bloque, este modelo es
equivalente a una prueba t pareada sobre las 10 diferencias (nutrientes −
control).

Preguntas que suelen surgir:

- *¿Por qué promediar las plántulas por parcela y no usarlas individualmente?*
  Se puede usar las plántulas individuales, pero entonces hay que incluir la
  parcela: `(1 | bloque/parcela)`. La parcela es la **unidad experimental** (el
  tratamiento se asignó a parcelas completas), así que el efecto del tratamiento
  debe evaluarse contra la variación entre parcelas, no entre plántulas. Omitir
  la parcela en ese modelo sí sería pseudorreplicación. Promediar es la forma
  simple de respetar la unidad experimental.
- *¿Por qué no usar la humedad como covariable en lugar del bloque?* Se podría
  si se midió, pero el bloque captura la humedad *y* todo lo demás que varía
  espacialmente (suelo, luz, herbivoría). El bloque no requiere saber cuáles son
  esas variables.
- Un "lote" o corrida experimental en invernadero es un bloque en el tiempo; se
  analiza igual.

**Dentro o entre grupos:** el tratamiento se compara *dentro* de cada bloque. Si
se omite el bloque, la varianza entre bloques (el gradiente de humedad) queda en
el residuo y el intervalo sale **demasiado amplio**. Es la razón por la que
bloquear aumenta la potencia.

### Caso 4. Predictor medido a nivel de sitio

En el caso, se mide la altura de cada planta al inicio y al final de la estación,
y se calcula un único incremento de altura por planta. Para ese análisis de
incrementos, una estructura inicial es:

```text
crecimiento ~ cobertura + (1 | sitio)
```

La cobertura del dosel varía entre los 12 sitios, no entre las 120 plantas. Las
plantas de un mismo sitio comparten condiciones y no son réplicas independientes
para el predictor cobertura. El intercepto aleatorio de sitio representa la
correlación entre plantas del mismo sitio. El efecto de cobertura se informa
principalmente por las diferencias entre los 12 sitios.

No se necesita agregar `(1 | planta)` cuando cada planta aporta un solo valor de
incremento: la variación entre plantas queda en el error residual. Aunque la
altura se midió dos veces, el análisis propuesto utiliza un único resultado
calculado por planta. Si en cambio se modelaran las dos mediciones de altura como
observaciones separadas, estas serían repetidas dentro de cada planta y sí se
podría incluir un intercepto de planta anidado en sitio:

```text
crecimiento ~ cobertura + (1 | sitio/planta)
```

En la notación de modelos mixtos, `sitio/planta` representa un efecto de sitio y
otro de planta dentro de sitio. El orden inverso, `planta/sitio`, no representa
esa jerarquía.

La comparación conceptual relevante es entre un modelo que ignora los sitios,
`crecimiento ~ cobertura`, y el modelo que representa su agrupamiento,
`crecimiento ~ cobertura + (1 | sitio)`. No se trata de comparar un modelo con
efecto aleatorio de planta contra otro con efectos aleatorios de planta y sitio.

**¿Por qué no `sitio` como efecto fijo?** Algunos grupos lo propondrán a partir
de la tabla de la página 1 (12 niveles, "pocos grupos"). No es posible: la
cobertura es constante dentro de cada sitio, así que `sitio` como factor fijo
es perfectamente colineal con `cobertura` y la pendiente de cobertura no se
puede estimar. Este es el caso en que el efecto aleatorio no es una opción sino
la única forma de tener la estructura de sitio *y* un predictor a nivel de
sitio. Es el argumento más fuerte del caso.

**Chequeo útil:** el modelo mixto da casi el mismo resultado que una regresión
simple de los 12 promedios de crecimiento por sitio contra la cobertura. Si los
grupos ven eso, entienden de dónde viene la información: de 12 sitios, con unos
10 grados de libertad para la pendiente. El efecto aleatorio da intervalos
honestos; no crea información que no existe.

**Dentro o entre grupos:** la cobertura varía *entre* sitios. Si se omite el
sitio, las 120 plantas se tratan como réplicas independientes de un predictor que
solo tiene 12 valores: pseudorreplicación, intervalo **demasiado estrecho**.

## Respuestas a las preguntas de discusión

Las preguntas corresponden a la sección "Preguntas de discusión y para la
bitácora" de la hoja de trabajo.

**1. En diseños anidados, ¿cuáles observaciones comparten condiciones o individuo?
¿Qué variable(s) de agrupamiento las representan?**

- Caso 1: las plántulas de una misma parcela comparten condiciones de parcela; las
  parcelas de un mismo sitio comparten condiciones de sitio. Variables: `sitio` y
  `parcela` dentro de `sitio`.
- Caso 4: las plantas de un mismo sitio comparten suelo, clima y el mismo valor
  de cobertura. Variable: `sitio`.
- Caso 2 (individuo): las ocho mediciones de una plántula corresponden al mismo
  individuo. Variable: `plantula`.

**2. En medidas repetidas, ¿qué término evalúa si el tratamiento cambia la tasa
de crecimiento?**

La interacción `tratamiento:semana` en `altura ~ tratamiento * semana + ...`. La
pendiente de `semana` es la tasa de crecimiento del grupo de referencia; la
interacción es la diferencia de pendiente del otro tratamiento. El efecto
principal de `tratamiento` solo compara la altura inicial (en `semana = 0`), no
la tasa. Conecta con L04: los términos de interacción son diferencias en la
pendiente respecto al nivel de referencia.

**3. ¿Dentro o entre grupos? ¿Qué pasa con la incertidumbre si se omite el
agrupamiento?**

| Caso | Comparación | Si se omite el agrupamiento |
|---|---|---|
| 1. Muestreo anidado | Tratamiento *dentro* de parcelas | Intervalo demasiado amplio (pierde precisión) |
| 2. Medidas repetidas | Tratamiento *entre* plántulas | Intervalo demasiado estrecho (pseudorreplicación) |
| 3. Diseño en bloques | Tratamiento *dentro* de bloques | Intervalo demasiado amplio |
| 4. Predictor a nivel de sitio | Cobertura *entre* sitios | Intervalo demasiado estrecho (pseudorreplicación) |

Lo que se busca es que los grupos no respondan "pseudorreplicación" para los
cuatro casos. En los casos 1 y 3 el efecto aleatorio absorbe variación de ruido;
en los casos 2 y 4 impide contar como independientes observaciones que no lo
son.

## Entrada de bitácora: efectos de lote

Es un caso de transferencia: la misma estructura del caso 3 (bloque), pero el
bloque es temporal y la unidad experimental es distinta.

**Estructura esperada:**

```text
crecimiento ~ tratamiento + (1 | lote)
```

1. **Unidad experimental:** la maceta (el tratamiento se asignó a macetas
   individuales). Las 20 macetas de un mismo lote comparten temperatura y luz.
2. **Efecto aleatorio:** `lote`. Las plántulas de una misma corrida no son
   independientes porque comparten las condiciones de esa corrida. Con solo seis
   lotes, la varianza entre lotes se estima con poca precisión; tratar lote como
   efecto fijo es defendible si solo interesan esos seis lotes. Aceptar ambas
   respuestas si están justificadas.
3. **Parecido al caso 3:** un lote es un bloque en el tiempo y el análisis es el
   mismo. **Diferencia:** en el caso 3 la unidad experimental es la parcela (dos
   por bloque, una por tratamiento), por eso se promedian las plántulas. Aquí la
   unidad experimental es la maceta y hay 10 por tratamiento dentro de cada lote,
   así que no hace falta promediar ni agregar otro nivel. Algunos estudiantes
   dirán que se parece al caso 1 (plántulas dentro de grupos); está bien siempre
   que noten que el lote no está anidado en nada más.
4. **Dentro de lotes.** Omitir el lote deja su varianza en el residuo: intervalo
   **demasiado amplio**, se pierde precisión, no es pseudorreplicación. Si un
   lote tuviera solo un tratamiento, el efecto del tratamiento quedaría
   confundido con el efecto del lote y no habría forma de separarlos.

Error común a vigilar: responder "demasiado pequeña / pseudorreplicación" por
analogía con los casos 2 y 4. La pregunta 4 está para detectar si entendieron la
distinción dentro/entre.

## Puntos para enfatizar

- Un efecto aleatorio no siempre "agranda" la incertidumbre. Cuando el predictor
  varía dentro de los grupos, la reduce; cuando varía entre grupos, la corrige
  hacia arriba.
- La asignación balanceada no elimina la dependencia debida a bloques, sitios o
  mediciones repetidas.
- La regla de "5 a 10 grupos o más" de la tabla es una guía, no una ley. Para los
  casos 1 y 3 es aceptable que un grupo responda "fijo" o "depende" si lo
  justifica con el objetivo de inferencia. Para el caso 4 no aplica: ahí el
  efecto fijo es imposible (ver colinealidad).
- El número de niveles independientes de un predictor importa. Tener muchas
  plantas en pocos sitios no sustituye muestrear más sitios para estimar una
  relación a nivel de sitio.
- La estructura de muestreo y la unidad de asignación del tratamiento son
  conceptos distintos: las plántulas pueden recibir el tratamiento
  individualmente y aun así compartir condiciones de sitio o parcela.
