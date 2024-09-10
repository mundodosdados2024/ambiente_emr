#!/bin/bash

# Esperar o MinIO iniciar
echo "Esperando o MinIO iniciar..."
sleep 10

echo "Configurando chaves de acesso..."
mc alias set myminio http://localhost:9000 datalake datalake

echo "Criando buckets..."
mc mb myminio/serasaexperian-odin-data-mesh-dev-multiprovider --region sa-east-1
mc mb myminio/datahub-comportamental-input-dev --region sa-east-1

#
#
# echo "Configurando buckets como públicos..."
# # mc policy set public myminio/serasaexperian-odin-data-mesh-dev-multiprovider
# # mc policy set public myminio/datahub-comportamental-input-dev
#
mc anonymous set public myminio/serasaexperian-odin-data-mesh-dev-multiprovider
mc anonymous set public myminio/datahub-comportamental-input-dev

echo "Buckets e chaves de acesso configurados."

echo "Configuração completa."
