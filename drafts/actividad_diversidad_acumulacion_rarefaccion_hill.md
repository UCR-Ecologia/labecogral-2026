# Laboratorio de Ecología General: ¿Cuál comunidad es más diversa?

## Simulación de muestreo, acumulación de especies, rarefacción y números de Hill

> **Pregunta guía:** Dos equipos reportan diferentes números de especies en dos hábitats, pero no realizaron el mismo esfuerzo de muestreo. ¿Es válido concluir que uno es más diverso?

## 1. Objetivos de aprendizaje

Al finalizar, el estudiantado podrá:

1. Distinguir la **riqueza observada** de la riqueza real y explicar por qué depende del esfuerzo y del azar.
2. Construir e interpretar una **curva de acumulación** de especies a partir de una secuencia de individuos.
3. Aplicar **rarefacción individual basada en muestras** mediante submuestreo aleatorio sin reemplazo, para comparar riqueza a un esfuerzo común.
4. Calcular riqueza, entropía de Shannon e índice de concentración de Simpson; convertirlos en **números efectivos de especies** (números de Hill de órdenes 0, 1 y 2).
5. Explicar cómo la dominancia y las especies raras modifican la diversidad estimada.
6. Formular conclusiones prudentes, reconociendo la variación entre muestras y las limitaciones de estandarizar únicamente el tamaño de muestra.

## 2. Idea central y encuadre

La clase representa un equipo de consultoría que debe evaluar dos comunidades biológicas. Las «comunidades» son bolsas opacas con fichas: cada ficha representa **un individuo** y cada letra o símbolo representa **una especie**. El ejercicio no consiste en adivinar cuál bolsa contiene más especies, sino en decidir **qué puede inferirse de muestras incompletas**.

**No revelar al inicio** la composición total de las bolsas. La revelación final permite contrastar riqueza observada, diversidad estimada y composición real.

### Conceptos que deben distinguirse

- **Curva de acumulación observada:** riqueza acumulada a medida que se incorporan individuos en un orden concreto. Una trayectoria depende del orden de extracción.
- **Rarefacción:** riqueza (o diversidad, si se define apropiadamente) esperada en submuestras aleatorias de tamaño fijo de una **muestra observada**. No equivale a simplemente recortar los primeros diez puntos de la curva de acumulación.
- **Esfuerzo igual:** mismo número de individuos; no implica necesariamente igual **cobertura de muestra** o probabilidad de detectar especies raras.
- **Riqueza versus diversidad efectiva:** dos comunidades pueden tener la misma riqueza y distinta distribución de abundancias.

## 3. Materiales y preparación

Para dos bolsas, preparar **80 fichas por bolsa**, indistinguibles al tacto y con letras o símbolos visibles al extraerlas. Usar dos bolsas opacas, recipientes para ordenar fichas, hojas cuadriculadas, calculadoras y hojas de registro. Conviene usar fichas plastificadas o de cartulina gruesa de igual tamaño.

### Composición propuesta (solo para docentes; mantener oculta)

| Especie   | Bolsa A: uniforme | Bolsa B: dominancia y rareza |
| --------- | ----------------: | ---------------------------: |
| A         |                10 |                           42 |
| B         |                10 |                           16 |
| C         |                10 |                            8 |
| D         |                10 |                            5 |
| E         |                10 |                            3 |
| F         |                10 |                            2 |
| G         |                10 |                            2 |
| H         |                10 |                            2 |
| **Total** |            **80** |                       **80** |

Ambas comunidades contienen **8 especies**. A tiene abundancias iguales; B presenta una especie dominante y varias raras. Este contraste está diseñado para que las diferencias entre órdenes de diversidad sean visibles incluso cuando la riqueza verdadera es igual. **No garantiza** que cada muestra individual muestre un patrón específico: esa variabilidad es parte del aprendizaje.

**Alternativa para una segunda edición:** modificar la bolsa B para que tenga más especies reales pero menor equidad. Esto permite que las comunidades cambien de posición al pasar de q = 0 a q = 1 o 2. Para la primera implementación, mantener la misma riqueza real simplifica la interpretación.

### Distribución entre equipos y prevención de sesgos

Idealmente, cada equipo muestrea **ambas bolsas**, una después de otra. Asignar esfuerzos desiguales entre equipos:

| Equipo |       Bolsa A |       Bolsa B |
| ------ | ------------: | ------------: |
| 1      | 15 individuos | 30 individuos |
| 2      | 30 individuos | 15 individuos |
| 3      | 20 individuos | 40 individuos |
| 4      | 40 individuos | 20 individuos |

Con más de cuatro equipos, repetir la asignación. **Importante:** antes de que otro equipo use una bolsa, devolver **todas** las fichas, verificar el total de 80 y mezclar bien. Así, cada equipo obtiene una muestra independiente de la misma comunidad simulada. Alternativamente, preparar juegos idénticos de bolsas para trabajar simultáneamente.

La unidad de observación de esta simulación es el individuo (ficha); las repeticiones de submuestreo **no son réplicas biológicas independientes**.

## 4. Secuencia de la sesión (180 minutos)

| Fase                       | Tiempo | Actividad                                                                            | Producto                     |
| -------------------------- | -----: | ------------------------------------------------------------------------------------ | ---------------------------- |
| Planteamiento del problema | 10 min | Presentar los dos informes con esfuerzos desiguales; pedir una conclusión preliminar | Hipótesis inicial            |
| Muestreo y acumulación     | 35 min | Extraer fichas sin reemplazo, registrar cada individuo y graficar riqueza acumulada  | Dos trayectorias por equipo  |
| Comparación inicial        | 15 min | Reunir resultados; discutir si diferencias reflejan esfuerzo, estructura o azar      | Preguntas de inferencia      |
| Diversidad y Hill          | 35 min | Tabular abundancias y calcular q = 0, 1 y 2 para la muestra completa de cada bolsa   | Tabla comparativa            |
| Rarefacción manual         | 40 min | Repetir submuestras a esfuerzo común; estimar riqueza esperada                       | Puntos/curvas de rarefacción |
| Interpretación y cierre    | 30 min | Comparar resultados, revelar las bolsas y discutir limitaciones                      | Conclusión técnica           |
| Transiciones / margen      | 15 min | Reorganización y dudas                                                               | —                            |

**Versión de 150 minutos:** usar solo 5 repeticiones por tamaño de submuestra y calcular índices de Hill únicamente para una de las dos bolsas por equipo; compartir resultados entre equipos.

## 5. Protocolo para estudiantes

### Fase I. Muestreo y curva de acumulación

1. Recibir la bolsa asignada y el esfuerzo de muestreo indicado.
2. Mezclar la bolsa sin mirar dentro.
3. Extraer **una ficha a la vez, sin devolverla**. Registrar su especie y el número acumulado de especies distintas.
4. Continuar hasta completar el esfuerzo asignado. Conservar las fichas extraídas, separadas del resto.
5. Graficar **número acumulado de especies** (eje Y) frente a **número de individuos extraídos** (eje X). Iniciar en (0, 0).
6. Elaborar una segunda curva para la otra bolsa. Si se reutilizan las bolsas entre equipos, devolver las fichas al terminar todas las fases que requieren la muestra.

**Registro mínimo:**

| Individuo n | Especie extraída | ¿Nueva especie? (sí/no) | Riqueza acumulada S(n) |
| ----------: | ---------------- | ----------------------- | ---------------------: |
|           1 |                  |                         |                        |
|           2 |                  |                         |                        |
|           … |                  |                         |                        |
|           N |                  |                         |                        |

**Preguntas antes de seguir:** ¿Se estabilizó la curva? ¿Puede saberse cuántas especies faltan? ¿Dos equipos que muestrearon la misma bolsa obtuvieron idénticos resultados?

### Fase II. Cálculo de diversidad

Para **cada muestra completa**, contar individuos por especie y calcular \(p_i=n_i/N\). Omitir especies no detectadas de las sumas (su contribución es cero).

| Medida                                | Cálculo                 | Interpretación                                                                           |
| ------------------------------------- | ----------------------- | ---------------------------------------------------------------------------------------- |
| Riqueza, \({}^0D\)                    | \(S\_{\mathrm{obs}}\)   | Número de especies observadas                                                            |
| Shannon, \(H'\)                       | \(-\sum_i p_i\ln(p_i)\) | Entropía de abundancias                                                                  |
| Hill \(q=1\), \({}^1D\)               | \(\exp(H')\)            | Número efectivo de especies según Shannon                                                |
| Concentración de Simpson, \(\lambda\) | \(\sum_i p_i^2\)        | Probabilidad de coincidencia de especie en dos extracciones independientes con reemplazo |
| Hill \(q=2\), \({}^2D\)               | \(1/\lambda\)           | Número efectivo de especies según Simpson                                                |

> **Número efectivo de especies:** número de especies **igualmente abundantes** que produciría el mismo valor del índice. No es una estimación de especies «ocultas». Para una muestra dada, normalmente \({}^0D\geq{}^1D\geq{}^2D\).

**Hoja de cálculo manual:**

| Especie  | \(n_i\) | \(p_i\) | \(p_i\ln p_i\) | \(p_i^2\) |
| -------- | ------: | ------: | -------------: | --------: |
| A        |         |         |                |           |
| B        |         |         |                |           |
| …        |         |         |                |           |
| **Suma** |   **N** |   **1** |                |           |

Permitir calculadora para logaritmos y exponenciales. Si el tiempo es limitado, pedir a cada estudiante un cálculo completo de una muestra y comparar los resultados de las otras muestras en plenaria.

**Pregunta clave:** si las dos bolsas contienen el mismo número real de especies, ¿por qué sus números efectivos de especies pueden ser distintos?

### Fase III. Rarefacción individual

**Problema:** una muestra tiene 15 individuos y otra 30 o 40. Comparar sus riquezas observadas directamente puede confundir diferencia ecológica y esfuerzo.

1. Elegir un esfuerzo común \(m\) **no mayor que el menor tamaño de muestra que se va a comparar**. Para toda la clase, \(m=10\) es una opción práctica.
2. Tomar **solo las fichas que ya integran la muestra observada** (por ejemplo, las 30 fichas extraídas en la fase I). **No usar el contenido restante de la bolsa original.**
3. Mezclar las fichas de la muestra y extraer \(m\) sin reemplazo.
4. Contar cuántas especies distintas aparecen.
5. Devolver las \(m\) fichas a la **misma muestra observada**, mezclar y repetir 5–10 veces.
6. Calcular la riqueza media entre repeticiones. Esa media aproxima la riqueza esperada por rarefacción al tamaño \(m\).

**Tabla de rarefacción (ejemplo, \(m=10\)):**

| Repetición | Riqueza en 10 individuos |
| ---------: | -----------------------: |
|          1 |                          |
|          2 |                          |
|          3 |                          |
|          4 |                          |
|          5 |                          |
|  **Media** |                          |

Para **construir una curva de rarefacción**, repetir el proceso con tamaños \(m=5,10,15\) (y 20 si ambas muestras tienen al menos 20 individuos). En cada tamaño, representar **la riqueza media** de las repeticiones, no una sola extracción. Añadir el punto final de riqueza observada para \(m=N\).

**Restricción:** una muestra de 15 individuos no permite rarefacción a 20. Tampoco se debe extrapolar manualmente más allá del tamaño observado y llamarlo rarefacción.

**Precisión conceptual:** el procedimiento aproxima la rarefacción de la **muestra observada**. La media de 5–10 repeticiones será ruidosa; una curva analítica o muchas repeticiones sería más estable. Los subsamples repetidos son simulaciones condicionales a esa muestra, no nuevas muestras independientes del hábitat.

### Fase IV. Integración y discusión

Reunir en la pizarra, para cada equipo y bolsa: \(N\), riqueza observada, \({}^1D\), \({}^2D\) y riqueza rarefactada a \(m=10\).

**Preguntas de interpretación:**

1. ¿Qué cambia al comparar riqueza observada frente a riqueza rarefactada?
2. ¿Las diferencias entre equipos que usaron la misma bolsa son evidencia de diferencias ecológicas?
3. ¿Por qué las curvas de acumulación de una misma bolsa pueden tener formas distintas?
4. ¿Cómo afecta la dominancia a \({}^1D\) y \({}^2D\)? ¿Por qué \({}^0D\) responde de otra manera?
5. ¿Qué información se pierde al resumir una comunidad con un solo número?
6. ¿Igual número de individuos implica igual probabilidad de detectar especies raras?

**Revelación final:** vaciar las bolsas, contar todas las fichas y comparar la composición real con los resultados. Preguntar qué inferencias eran correctas, cuáles dependían del azar y qué datos adicionales se necesitarían para una evaluación real.

## 6. Producto final y evaluación sugerida

Cada equipo entrega una página o dos con:

- Dos curvas de acumulación y ejes rotulados.
- Tabla de abundancias e índices \({}^0D\), \({}^1D\), \({}^2D\).
- Al menos una comparación de riqueza rarefactada al mismo \(m\), indicando número de repeticiones.
- **Conclusión de 150–200 palabras** que responda cuál comunidad parece más diversa, **según qué medida**, y con qué limitaciones.

**Criterios de evaluación (propuesta):** registro y representación (25 %), cálculos e interpretación de índices (25 %), aplicación de rarefacción (25 %), calidad de inferencia y reconocimiento de límites (25 %).

## 7. Notas para docentes: decisiones importantes

### No confundir rarefacción con acumulación

Una curva de acumulación sigue **un orden particular** de extracción. La rarefacción promedia muchos subconjuntos posibles de la **muestra ya obtenida**. La rarefacción de riqueza puede calcularse exactamente a partir de las abundancias observadas, pero aquí se aproxima por sorteos para que el mecanismo sea tangible.

### ¿Rarefacción de Shannon y Simpson?

En esta primera versión, **rarefactar solo la riqueza** y calcular Shannon/Simpson para las muestras completas. Si sobra tiempo, calcular los números de Hill en **una** submuestra estandarizada y comparar; evitar llamar «estimaciones insesgadas de diversidad verdadera» a los promedios de índices calculados sobre submuestras. La estandarización y estimación de diversidad de órdenes \(q=1\) y \(q=2\) tiene matices que exceden el ejercicio manual.

### ¿Qué ocurre si hay varios equipos?

- Reponer las fichas **entre equipos**, pero **no durante** la extracción de una muestra.
- Cada equipo debe anotar exactamente qué bolsa y qué esfuerzo utilizó.
- No interpretar las repeticiones de rarefacción como replicación de campo.
- Si hay suficiente material, duplicar físicamente las bolsas para reducir tiempos de espera.

### Extensión opcional: una tercera bolsa

Diseñar una bolsa C con **más especies, pero dominancia extrema**. Antes de calcular los índices, pedir predicciones sobre cuál bolsa tendrá mayor \({}^0D\), \({}^1D\) y \({}^2D\). Esto permite discutir cruces en el perfil de diversidad y la pregunta «¿qué queremos decir por más diversa?».

## 8. Lecturas recomendadas

**Lectura principal (índices y Hill):** Morris, E. K., et al. (2014). _Choosing and using diversity indices: insights for ecological applications from the German Biodiversity Exploratories._ **Ecology and Evolution**, 4, 3514–3524. DOI: 10.1002/ece3.1155.

**Lectura complementaria (muestreo y riqueza):** Gotelli, N. J. & Colwell, R. K. (2001). _Quantifying biodiversity: procedures and pitfalls in the measurement and comparison of species richness._ **Ecology Letters**, 4, 379–391.

**Para profundizar (docente):** Jost, L. (2006). _Entropy and diversity._ **Oikos**, 113, 363–375. DOI: 10.1111/j.2006.0030-1299.14714.x.

**Para profundizar (docente):** Chao, A. & Jost, L. (2012). _Coverage-based rarefaction and extrapolation: standardizing samples by completeness rather than size._ **Ecology**, 93, 2533–2547.

---

## 9. Lista de preparación antes de la clase

- [ ] Fabricar y contar 80 fichas por bolsa; verificar la composición.
- [ ] Marcar bolsas A y B sin mostrar abundancias.
- [ ] Preparar hojas de registro y papel cuadriculado.
- [ ] Tener calculadoras con funciones \(\ln\) y \(e^x\).
- [ ] Asignar equipos, esfuerzos y orden de uso de bolsas.
- [ ] Reservar tiempo para reponer y mezclar fichas entre equipos.
- [ ] Preparar tabla colectiva para resultados y composición real para la revelación.
- [ ] Decidir si se usarán 5 o 10 repeticiones por tamaño de rarefacción.
