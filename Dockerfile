# Dockerfile para servir la presentación GYMETRA
# IMPORTANTE: Este Dockerfile NO elimina contenedores ni imágenes existentes en Docker
# Solo construye una nueva imagen sin afectar recursos Docker existentes

FROM nginx:alpine

# Copiar los archivos de la presentación al directorio de nginx
COPY ["doc/manual/Presentacion GYMETRA/", "/usr/share/nginx/html/"]

# Exponer el puerto 80
EXPOSE 80

# Nginx se inicia automáticamente al ejecutar el contenedor
# NOTA: Este Dockerfile no ejecuta comandos que eliminen contenedores o imágenes
CMD ["nginx", "-g", "daemon off;"]

