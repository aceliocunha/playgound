#!/bin/bash
set -e

echo "==> Limpando..."
rm -f wave.vcd *.o *.cf

echo "==> Compilando..."
ghdl -a knn_k3.vhd
ghdl -a tb_knn_k3.vhd
ghdl -e tb_knn_k3

echo "==> Simulando..."
ghdl -r tb_knn_k3 --vcd=wave.vcd

echo "==> Abrindo GTKWave..."
gtkwave wave.vcd
