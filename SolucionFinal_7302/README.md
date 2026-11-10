# Solución final Kaggle · Ian Herrera Schein · Analista Jr

Competencia: `labo-1-virtual-2026-analista-jr` · Laboratorio de Implementación I · Universidad Austral 2026

**Envío elegido para el Private:** `KA7302_s20_1700.csv` (experimento 7302, semillerío de 20, corte de 1700 envíos).

## Qué es
Workflow Senior (`PredFinal/z739_final_senior.ipynb` de la cátedra) corrido sobre el dataset de Analista Jr, con tres cambios:

1. **Pandemia (hallazgo del Experimento Colaborativo #05, Grupo A):** los meses 202003 a 202010 (definición amplia) se excluyen del training y del entrenamiento final, y todos sus atributos se ponen en NA antes del Feature Engineering histórico, así los lags, deltas y tendencias que apuntan a esos meses quedan en NA.
2. **Optimización Bayesiana:** 100 iteraciones (la cátedra usa 40 como mínimo).
3. **Kaggle:** cortes de 1500 a 2200 envíos.

Todo lo demás (Catastrophe Analysis, deflación por IPC, lags 1 y 2, tendencias de 6 meses, variables de Random Forest, Canaritos Asesinos, semillerío de 20) queda como en el workflow de la cátedra.

- Semilla primigenia: `629903`
- Dataset: `analistajr_competencia_2026.csv.gz` (la notebook lo descarga del bucket de la cátedra si no está)

## Cómo reproducirlo
En una VM de la materia (entorno de la cátedra, kernel R):

```bash
mkdir -p ~/buckets/b1/labo2026v/PredFinal
cp 7302_final_senior_pandemia.ipynb correr_final_7302.sh ~/buckets/b1/labo2026v/PredFinal/
cd ~/buckets/b1/labo2026v/PredFinal
nohup bash correr_final_7302.sh > ~/log_7302.txt 2>&1 &
```

La corrida tarda unas 3 a 4 horas en una VM de 8 vCPU y 64 GB. Las salidas quedan en `~/buckets/b1/exp/WF7302/`; el archivo entregado es `kaggle/KA7302_s20_1700.csv`.

## Por qué el corte 1700
Se eligió por construcción y no por el pico del Public (1600): es el centro de la zona alta de la curva (1600 a 1900) y el máximo de la media móvil de tres cortes. El Public es el 30% de los clientes y no predice el Private.

| Corte | 1500 | 1600 | 1700 | 1800 | 1900 | 2000 | 2100 | 2200 |
|---|---|---|---|---|---|---|---|---|
| 7302 (Public) | 84,74 | 95,87 | 92,88 | 90,55 | 90,97 | 88,39 | 86,40 | 83,82 |
| 7301 sin el cambio de pandemia | 87,31 | 84,82 | 82,16 | 79,75 | 83,99 | 88,14 | 86,23 | 84,49 |
