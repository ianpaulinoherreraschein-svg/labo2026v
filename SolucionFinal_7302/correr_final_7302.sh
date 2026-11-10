#!/bin/bash
# Corre la solucion final completa. Si la VM se apaga, volver a lanzarlo:
# la Bayesian Optimization retoma desde HT.RDATA y los modelos ya entrenados no se rehacen.
NB=$HOME/buckets/b1/labo2026v/PredFinal/7302_final_senior_pandemia.ipynb
OUT=$HOME/buckets/b1/exp/WF7302
mkdir -p "$OUT"
echo "$(date '+%F %T')  ARRANCA final 7302"
if jupyter nbconvert --to notebook --execute \
     --ExecutePreprocessor.kernel_name=ir --ExecutePreprocessor.timeout=-1 \
     --output-dir="$OUT" --output="corrida_7302.ipynb" "$NB" ; then
  echo "$(date '+%F %T')  TERMINO final 7302"
else
  echo "$(date '+%F %T')  ERROR en final 7302 (ver mensaje de arriba)"
fi
