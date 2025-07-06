pipeline {
  agent any

  stages {
    stage('Clonar repositorio') {
      steps {
        // Baja tu código de GitHub
        git 'https://github.com/CarielR/simple-web.git'
      }
    }

    stage('Construir imagen') {
      steps {
        // Construye la imagen desde el Dockerfile en la raíz
        sh 'docker build -t simple-web:latest .'
      }
    }

    stage('Desplegar') {
      steps {
        // Para y elimina el contenedor anterior (si existe), luego levanta el nuevo
        sh '''
          docker stop simple-web || true
          docker rm simple-web  || true
          docker run -d --name simple-web -p 8081:80 simple-web:latest
        '''
      }
    }
  }

  post {
    success {
      echo "✅ simple-web levantada en http://localhost:8081"
    }
    failure {
      echo "❌ Falló el despliegue de simple-web"
    }
  }
}
