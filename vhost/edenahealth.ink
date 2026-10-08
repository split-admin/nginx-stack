client_max_body_size 50M;
# Proxy rules for backend microservices on edenahealth.ink
location /api/company/ {
    proxy_pass http://company-services:9095;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

location /api/person/ {
    proxy_pass http://ms-client-services:8081;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

location ~^/(api_integration|ws) {
    proxy_pass http://integration-service:9999;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}

location ~^/api/integration_ia/(.*)$ {
    proxy_pass http://integration-service:9999/api_integration/integration_ia/$1;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}

location ~^/api/(auth|roles|usuarios|menus) {
    proxy_pass http://login-services:9898;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

location ~^/api/(facturacion_electronica|monitor_facturacion_electronica|nota_credito|nota_debito) {
    proxy_pass http://facturacion-services:8199;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

location ~^/api/(orders|contabilidad|health|reportes-clinicos|rips|seguimiento) {
    proxy_pass http://orders-services:8087;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

location ~^/api/(parameters|modulos) {
    proxy_pass http://parametros-services:10020;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}

location ~^/api/(products|inventory) {
    proxy_pass http://product-services:8084;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}