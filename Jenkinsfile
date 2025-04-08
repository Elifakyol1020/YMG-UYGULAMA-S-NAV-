
pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        IMAGE_NAME = "uygulama-sinavi"
        CONTAINER_NAME = "uygulama-sinavi"
    }

    stages {
        stage("Repo Klonlama") {
            steps {
                git url: "https://github.com/Elifakyol1020/YMG-UYGULAMA-S-NAV-.git", branch: "main"
            }
        }

        stage("Docker image Oluştur") {
            steps {
                echo "Docker image oluşturuluyor"
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage("Eski container durdur") {
            steps {
                echo "Eski container durduruluyor"
                bat "docker rm -f %CONTAINER_NAME% || exit 0"
            }
        }

        stage("Yeni container oluştur") {
            steps {
                echo "Yeni container oluşturuluyor"
                bat "docker run -d --name %CONTAINER_NAME% -p 4444:80 %IMAGE_NAME%"
            }
        }
    }

    post {
        success {
            echo "Yayın başarılı: http://localhost:4444"
        }
        failure {
            echo "Pipeline başarısız oldu"
        }
    }
}
