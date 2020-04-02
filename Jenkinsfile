pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        catchError() {
          sh 'rbenv --version'
          // sh 'gem install calabash-android -v 0.9.8'
          withGradle() {
            sh './gradlew assembleDev'
          }

        }

      }
    }

    stage('E2E Tests') {
      when {
        expression {
          params.ENABLE_E2E
        }

      }
      steps {
        warnError(message: 'Error running appium') {
          dir('tests/BDT/calabash-gnu') {
            sh 'SCREENSHOT_PATH=screenshots/ calabash-android run ../../../app/build/outputs/apk/development/debug/GnucashAndroid_v2.4.0-dev3_r18a6bb36.apk'
          }
        }

      }
      post {
        always {
          dir('tests/BDT/calabash-gnu') {
            archiveArtifacts artifacts: 'screenshots/__diff_screenshots__/**/*.png', fingerprint: true
          }
        }
      }
    }

    stage('Random Testing') {
      when {
        expression {
          params.ENABLE_RANDOM_TESTING
        }

      }
      steps {
        warnError(message: 'Monkeys broke something') {
          sh "bash ./scripts/tests/monkey-test.sh ${params.NUM_RANDOM_EVENTS}"
        }

      }
    }

  }
  parameters {
    string(name: 'NUM_RANDOM_EVENTS', defaultValue: '1000', description: 'Number of events for Random testing')
    booleanParam(name: 'ENABLE_E2E', defaultValue: true, description: 'Enable E2E testing')
    booleanParam(name: 'ENABLE_RANDOM_TESTING', defaultValue: true, description: 'Enable random testing testing')
    booleanParam(name: 'UPDATE_SNAPSHOTS', defaultValue: false, description: 'Should updated VRT snapshots')
  }
}