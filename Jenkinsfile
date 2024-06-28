pipeline{
    //multiple stages{
        //multiple steps for execution
    agent any
    stages{
        stage('Clean Stage'){
            steps{
                echo 'CleanUp stage'
                cleanWs notFailBuild: true

            }

        }
        stage('Git Checkout'){
            steps{
                echo 'Checkout stage'
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rin94/KarateFrameworkTest.git']])

            }

        }
        stage('Restore Package Stage'){
            steps{
                echo 'echo Restore packege stage'

            }

        }
        stage('Build Stage'){
            steps{
                echo 'build stage'
                // Run Maven on a Unix agent.

                sh '/opt/homebrew/Cellar/maven/3.8.2/bin/mvn -version'
                sh '/opt/homebrew/Cellar/maven/3.8.2/bin/mvn clean compile'


            }

        }

        stage('Test Execution Stage'){

            steps{
                echo 'Test Execution stage $w'
                sh '/opt/homebrew/Cellar/maven/3.8.2/bin/mvn -P prod test'

            }

        }

    }

    post {
        always {
            // One or more steps need to be included within each condition's block.
            junit stdioRetention: '', testResults: 'target/surefire-reports/*.xml'
            cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
    }