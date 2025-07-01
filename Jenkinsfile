pipeline {
  agent any
  environment {
    IMAGE_NAME = "simple-web"
    IMAGE_TAG  = "${env.BUILD_NUMBER}"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Image') {
      steps {
        script {
          docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
          sh '''
            if docker ps -a --format "{{.Names}}" | grep -q "^${IMAGE_NAME}\$"; then
              docker rm -f ${IMAGE_NAME}
            fi
          '''
          docker.image("${IMAGE_NAME}:${IMAGE_TAG}")
                .run("-d --name ${IMAGE_NAME} -p 8081:80")
        }
      }
    }
  }
  post {
    success { echo "✅ Despliegue exitoso: ${IMAGE_NAME}:${IMAGE_TAG}" }
    failure { echo "❌ El pipeline falló" }
  }
}
