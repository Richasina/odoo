FROM odoo:17.0  

ARG LOCALE=en_US.UTF-8  

ENV LANGUAGE=${LOCALE}  
ENV LC_ALL=${LOCALE}  
ENV LANG=${LOCALE}  

USER 0  

RUN apt-get -y update && apt-get install -y --no-install-recommends locales netcat-openbsd \
    && locale-gen ${LOCALE}  

WORKDIR /var/lib/odoo  

COPY --chmod=755 entrypoint.sh ./  

# Expose Odoo default ports (8069 for web, 8072 for longpolling)
EXPOSE 8069 8072  

# Set PostgreSQL details (will be set via Railway environment variables)
ENV ODOO_DB_HOST=${DATABASE_URL}  
ENV ODOO_DB_USER=odoo  
ENV ODOO_DB_PASSWORD=odoo  

# Start Odoo
ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
