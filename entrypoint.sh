#!/bin/sh

echo "Waiting for PostgreSQL to be ready..."
while ! nc -z ${ODOO_DATABASE_HOST} 5432; do sleep 1; done

echo "Starting Odoo..."
exec odoo --db_host=${ODOO_DB_HOST} --db_user=${ODOO_DATABASE_USER} --db_password=${ODOO_DATABASE_PASSWORD}
