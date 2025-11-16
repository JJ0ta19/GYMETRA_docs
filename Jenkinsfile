pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'gymetra-presentation'
        CONTAINER_NAME = 'gymetra-presentation-container'
        PORT = '8080'
    }
    
    stages {
        stage('Verificar contenedor existente') {
            steps {
                script {
                    echo 'Verificando si ya existe un contenedor con el mismo nombre...'
                    echo 'IMPORTANTE: No se eliminarán contenedores ni imágenes existentes en Docker'
                    sh '''
                        if [ "$(docker ps -aq -f name=${CONTAINER_NAME})" ]; then
                            echo "ADVERTENCIA: Ya existe un contenedor con el nombre ${CONTAINER_NAME}"
                            echo "El pipeline continuará sin eliminar el contenedor existente"
                            echo "Si necesitas crear uno nuevo, usa un nombre diferente o detén/elimina manualmente el contenedor existente"
                        else
                            echo "No existe un contenedor con el nombre ${CONTAINER_NAME}, se procederá a crear uno nuevo"
                        fi
                    '''
                }
            }
        }
        
        stage('Construir imagen Docker') {
            steps {
                script {
                    echo 'Construyendo imagen Docker para la presentación GYMETRA...'
                    echo 'IMPORTANTE: No se eliminarán imágenes existentes en Docker'
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }
        
        stage('Crear y ejecutar contenedor') {
            steps {
                script {
                    echo "Creando y ejecutando contenedor en el puerto ${PORT}..."
                    echo 'IMPORTANTE: Si el contenedor ya existe, se omitirá la creación'
                    sh """
                        if [ ! "\$(docker ps -aq -f name=${CONTAINER_NAME})" ]; then
                            docker run -d \\
                                --name ${CONTAINER_NAME} \\
                                -p ${PORT}:80 \\
                                ${IMAGE_NAME}:latest
                        else
                            echo "El contenedor ${CONTAINER_NAME} ya existe. No se creará uno nuevo."
                            echo "Si el contenedor está detenido, puedes iniciarlo manualmente con: docker start ${CONTAINER_NAME}"
                        fi
                    """
                }
            }
        }
        
        stage('Verificar contenedor') {
            steps {
                script {
                    echo 'Verificando que el contenedor esté ejecutándose...'
                    sh '''
                        sleep 3
                        docker ps | grep ${CONTAINER_NAME}
                        echo "Contenedor ${CONTAINER_NAME} ejecutándose en el puerto ${PORT}"
                        echo "Accede a la presentación en: http://localhost:${PORT}/index.html"
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completado exitosamente. La presentación está disponible en el puerto especificado.'
        }
        failure {
            echo 'Pipeline falló. Revisa los logs para más detalles.'
        }
        always {
            echo 'Pipeline finalizado. No se han eliminado contenedores ni imágenes existentes.'
        }
    }
}

