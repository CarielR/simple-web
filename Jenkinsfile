pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // Clona este mismo repo (simple-web)
        checkout scm
      }
    }

    stage('Build & Deploy Web') {
      steps {
        // Construye la imagen y arranca el contenedor
        sh '''
          # Detiene y elimina el contenedor anterior si existe
          docker rm -f simple-web || true

          # Construye la imagen desde el Dockerfile de este directorio
          docker build -t simple-web:latest .

          # Arranca la web en segundo plano exponiendo el puerto 8081
          docker run -d --name simple-web -p 8081:80 simple-web:latest
        '''
      }
    }
  }

  post {
    success {
      echo "✅ simple-web está corriendo en http://localhost:8081"
    }
    failure {
      echo "❌ Error al levantar simple-web"
    }
  }
}
