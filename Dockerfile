# Seleccionamos la imagen oficial de Nginx sobre Alpine (ligera)
FROM nginx:alpine

# Metadatos opcionales
LABEL maintainer="tu-email@dominio.com"

# Copiamos el HTML al directorio raíz de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 80 (el que Nginx usa por defecto)
EXPOSE 80

# La imagen ya arranca Nginx en foreground por defecto, así que no necesitamos CMD
