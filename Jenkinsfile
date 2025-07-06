pipeline {
  agent any

  environment {
    // Nombre de la imagen y del contenedor
    IMAGE_NAME = "simple-web"
    IMAGE_TAG  = "latest"
    CONTAINER  = "simple-web"
    PORT       = "8081"
  }

  stages {
    stage('Checkout') {
      steps {
        // Usa la misma configuración SCM del job (URL y rama main)
        checkout scm
      }
    }

    stage('Build & Deploy') {
      steps {
        // Construye y reinicia tu contenedor web
        sh '''
          # Detiene y elimina el contenedor previo si existe
          docker stop $CONTAINER || true
          docker rm   $CONTAINER || true

          # Construye la imagen desde el Dockerfile de este directorio
          docker build -t $IMAGE_NAME:$IMAGE_TAG .

          # Inicia la web en background, mapeando el puerto 80 del contenedor al 8081 del host
          docker run -d \
            --name $CONTAINER \
            -p $PORT:80 \
            $IMAGE_NAME:$IMAGE_TAG
        '''
      }
    }
  }

  post {
    success {
      echo "✅ $IMAGE_NAME desplegado en http://localhost:$PORT"
    }
    failure {
      echo "❌ Falló el despliegue de $IMAGE_NAME"
    }
  }
}
