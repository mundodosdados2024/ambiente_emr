#!/bin/sh

# Esperar o PostgreSQL iniciar completamente
echo "Esperando o PostgreSQL iniciar..."
sleep 30  # Aumentar o tempo se necessário

# Verificar se o PostgreSQL está disponível
until pg_isready -U admin; do
  echo "Aguardando PostgreSQL iniciar..."
  sleep 5
done

# Configuração do Metastore
echo "Criando o banco de dados metastore_db e configurando permissões..."
psql -U admin -c "CREATE DATABASE metastore_db OWNER admin;"
psql -U admin -c "GRANT ALL PRIVILEGES ON DATABASE metastore_db TO admin;"

echo "Executando o script do Metastore..."
psql -U admin -d metastore_db -f /util/hive-schema-4.0.0.postgres.sql

# Configuração do Airflow
echo "Criando o banco de dados airflow e configurando permissões..."
psql -U admin -c "CREATE DATABASE airflow OWNER admin;"
psql -U admin -c "GRANT ALL PRIVILEGES ON DATABASE airflow TO admin;"

echo "Configuração completa."
