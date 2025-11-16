pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'gymetra-presentation'
        CONTAINER_NAME = 'gymetra-presentation-container'
        PORT = '8085'
    }
    
    stages {
        stage('Verificar contenedor existente') {
            steps {
                script {
                    echo 'Verificando si ya existe un contenedor con el mismo nombre...'
                    echo 'IMPORTANTE: No se eliminarán contenedores ni imágenes existentes en Docker'
                    powershell '''
                        $containerId = docker ps -aq -f "name=$env:CONTAINER_NAME"
                        if ($containerId) {
                            Write-Host "ADVERTENCIA: Ya existe un contenedor con el nombre $env:CONTAINER_NAME"
                            Write-Host "El pipeline continuara sin eliminar el contenedor existente"
                            Write-Host "Si necesitas crear uno nuevo, usa un nombre diferente o deten/elimina manualmente el contenedor existente"
                        } else {
                            Write-Host "No existe un contenedor con el nombre $env:CONTAINER_NAME, se procedera a crear uno nuevo"
                        }
                    '''
                }
            }
        }
        
        stage('Construir imagen Docker') {
            steps {
                script {
                    echo 'Construyendo imagen Docker para la presentación GYMETRA...'
                    echo 'IMPORTANTE: No se eliminarán imágenes existentes en Docker'
                    powershell "docker build -t `$env:IMAGE_NAME`:latest ."
                }
            }
        }
        
        stage('Crear y ejecutar contenedor') {
            steps {
                script {
                    echo "Creando y ejecutando contenedor en el puerto %PORT%..."
                    echo 'IMPORTANTE: Si el contenedor ya existe, se omitirá la creación'
                    powershell """
                        `$containerId = docker ps -aq -f "name=`$env:CONTAINER_NAME"
                        if (-not `$containerId) {
                            docker run -d --name `$env:CONTAINER_NAME -p `$env:PORT`:80 `$env:IMAGE_NAME`:latest
                        } else {
                            Write-Host "El contenedor `$env:CONTAINER_NAME ya existe. No se creara uno nuevo."
                            Write-Host "Si el contenedor esta detenido, puedes iniciarlo manualmente con: docker start `$env:CONTAINER_NAME"
                        }
                    """
                }
            }
        }
        
        stage('Verificar contenedor') {
            steps {
                script {
                    echo 'Verificando que el contenedor esté ejecutándose...'
                    powershell '''
                        Start-Sleep -Seconds 3
                        docker ps | Select-String $env:CONTAINER_NAME
                        Write-Host "Contenedor $env:CONTAINER_NAME ejecutandose en el puerto $env:PORT"
                        Write-Host "Accede a la presentacion en: http://localhost:$env:PORT/index.html"
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

