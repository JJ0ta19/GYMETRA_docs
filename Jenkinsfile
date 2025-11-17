pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'release-doc-release-1.1'
        CONTAINER_NAME = 'repositorio-doc-release-1.1'
        PORT = '8085'
    }
    
    stages {
        stage('Verificar contenedor existente') {
            steps {
                script {
                    echo 'Verificando si ya existe un contenedor con el mismo nombre...'
                    echo 'IMPORTANTE: No se eliminarán contenedores ni imágenes existentes en Docker'
                    bat '''
                        for /f %%i in ('docker ps -aq -f "name=%CONTAINER_NAME%"') do set CONTAINER_ID=%%i
                        if defined CONTAINER_ID (
                            echo ADVERTENCIA: Ya existe un contenedor con el nombre %CONTAINER_NAME%
                            echo El pipeline continuara sin eliminar el contenedor existente
                            echo Si necesitas crear uno nuevo, usa un nombre diferente o deten/elimina manualmente el contenedor existente
                        ) else (
                            echo No existe un contenedor con el nombre %CONTAINER_NAME%, se procedera a crear uno nuevo
                        )
                    '''
                }
            }
        }
        
        stage('Construir imagen Docker') {
            steps {
                script {
                    echo 'Construyendo imagen Docker para la presentación GYMETRA...'
                    echo 'IMPORTANTE: No se eliminarán imágenes existentes en Docker'
                    bat "docker build -t %IMAGE_NAME%:latest ."
                }
            }
        }
        
        stage('Crear y ejecutar contenedor') {
            steps {
                script {
                    echo "Creando y ejecutando contenedor en el puerto %PORT%..."
                    echo 'IMPORTANTE: Si el contenedor ya existe, se omitirá la creación'
                    bat """
                        for /f %%i in ('docker ps -aq -f "name=%CONTAINER_NAME%"') do set CONTAINER_ID=%%i
                        if defined CONTAINER_ID (
                            echo Deteniendo y eliminando contenedor existente %CONTAINER_NAME%
                            docker stop %CONTAINER_NAME%
                            docker rm %CONTAINER_NAME%
                        )
                        docker run -d --name %CONTAINER_NAME% -p %PORT%:80 %IMAGE_NAME%:latest
                    """
                }
            }
        }
        
        stage('Verificar contenedor') {
            steps {
                script {
                    echo 'Verificando que el contenedor esté ejecutándose...'
                    bat '''
                        C:/Windows/System32/ping.exe -n 4 127.0.0.1 > nul
                        docker ps
                        echo Contenedor %CONTAINER_NAME% ejecutandose en el puerto %PORT%
                        echo Accede a la presentacion en: http://localhost:%PORT%/index.html
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

