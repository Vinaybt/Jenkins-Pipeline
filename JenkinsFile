pipeline {
    agent {
        label 'jenkins-cpp-agent'
    }

    environment {
        BUILD_DIR = "build"
        APP_NAME = "app"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Vinaybt/Jenkins-Pipeline.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '''
                    echo "[INFO] installing build tools..."
                    apt-get update && apt-get install -y build-essential
                '''
            }
        }
        stage('Build Application') {
            steps {
                sh '''
                    echo "[INFO] Building C++ Application"
                    mkdir -p ${BUILD_DIR}
                    g++ -o ${BUILD_DIR}/{APP_NAME} main.cpp
                    echo "Build Successful"
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    echo "[INFO] Running Tests..."
                    # simulate a test
                    if [ -f ${BUILD_DIR}/{APP_NAME} ]; then
                        echo "[TEST PASSED] Binary exists"
                    else 
                        echo "[TEST FAILED] Binary missing"
                        exit 1
                    fi
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    echo "[INFO] Deploying to /tmp/deployment-folder..."
                    mkdir -p /tmp/deployment-folder
                    cp ${BUILD_DIR}/{APP_NAME} /tmp/deployment-folder/
                    echo "[INFO] Deployment Successful"
                '''
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: '**/*', fingerprint: true
            }
        }
    }
    post {
        success {
            echo "[SUCCESS] Build and deployment succeeded."
        }
        failure {
            echo "[FAILED] Something went wrong."
        }
    }
}
