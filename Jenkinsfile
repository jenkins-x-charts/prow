pipeline {
    agent {
        label "jenkins-jx-base"
    }
    environment {
        ORG         = 'jenkinsxio'
        APP_NAME    = 'prow'
    }
    stages {
        stage('CI Build and Test') {
            when {
                branch 'PR-*'
            }
            steps {
                container('jx-base') {
                    sh "helm init --client-only"

                    sh "make build"
                    sh "helm template ."
                }
            }
        }

        stage('Build and Release') {
            environment {
                CHARTMUSEUM_CREDS = credentials('jenkins-x-chartmuseum')
            }
            when {
                branch 'master'
            }
            steps {
                container('jx-base') {
                    dir('prow') {
                        checkout scm
                        // ensure we're not on a detached head
                        sh "git checkout master"
                        // until we switch to the new kubernetes / jenkins credential implementation use git credentials store
                        sh "git config --global credential.helper store"
                        sh "jx step git credentials"
                        sh "echo \$(jx-release-version) > VERSION"
                        sh "jx step tag --version \$(cat VERSION)"

                        sh "helm init --client-only"
                        sh "make release"
                    }
                }
            }
        }
    }
}
