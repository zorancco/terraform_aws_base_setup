#!/usr/bin/env groovy

node {
   stage 'checkout'
        checkout scm

   stage name: 'plan', concurrency: 1
        sh "terraform plan --out plan"

   stage name: 'deploy', concurrency: 1
        def deploy_validation = input(
            id: 'Deploy',
            message: 'Let\'s continue the deploy plan',
            type: "boolean")

        sh "terraform apply plan"
}