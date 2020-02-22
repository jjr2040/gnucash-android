pipeline {
  agent {
    docker { image 'bitriseio/docker-android:latest'}
  }

  environment { 
    // ROOT_DIR = "${WORKSPACE}/gnucash-android"
    BRANCH = 'master'
    REPO_URL = 'https://github.com/jjr2040/gnucash-android.git'
  }

  stages {

    stage('Checkout and build') {
      steps {
        checkoutAndBuild()
      }
    }

    stage('Test') {
      steps {
        runMonkeyTest()
      }
    }

  }
}

// Steps

def checkoutAndBuild() {

  git "${REPO_URL}"

  sh './gradlew build installDevelopmentDebug'

  // withGradle {
  //   sh './gradlew build installDevelopmentDebug'
  // }
}

def runMonkeyTest() {
  sh 'echo "Tests running"'
}