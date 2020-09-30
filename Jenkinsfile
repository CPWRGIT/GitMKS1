#!/usr/bin/env groovy
import hudson.model.*
import hudson.EnvVars
import groovy.json.JsonSlurper
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import java.net.URL

String ISPW_Application     = "GIT1"        // Change to your assigned application
String HCI_Token            = "PFHMKS0"     // Change to your assigned ID

node {
  stage ('Checkout')
  {
    // Get the code from the Git repository
    checkout scm
  }

  stage('Git to ISPW Synchronization')
  {
    gitToIspwIntegration app: "${ISPW_Application}",
    branchMapping: '''*master* => MSTR, per-branch'
    feature1* => FT1, per-branch
    feature2* => FT2, per-branch
    bug* => HFIX, per-branch''',
    //connectionId: '38e854b0-f7d3-4a8f-bf31-2d8bfac3dbd4', // CWC2
    //connectionId: '4b4cf589-b835-4579-96ee-2aba6b818125', // TD-CWCC
    connectionId: '91bae501-8b4d-4155-909d-2ad5aa9f3131', // DEMO-CWCC
    credentialsId: "${HCI_Token}",
    gitCredentialsId: 'CPWRGIT', // Compuware github
    gitRepoUrl: 'https://github.com/CPWRGIT/GitMKS1.git',   // Change this to your repo
    //runtimeConfig: 'isp8', // CWC2
    runtimeConfig: 'ispw', // CWCC
    stream: 'GITDEMO'
  }

  stage('Build ISPW assignment')
  {
    //ispwOperation connectionId: '38e854b0-f7d3-4a8f-bf31-2d8bfac3dbd4', // CWC2
    //ispwOperation connectionId: '4b4cf589-b835-4579-96ee-2aba6b818125', // TD-CWCC
    ispwOperation connectionId: '91bae501-8b4d-4155-909d-2ad5aa9f3131', // DEMO-CWCC
    consoleLogResponseBody: false,
    //credentialsId: 'CWEZXXX-CES', // CWC2
    credentialsId: 'PFHMKS0-CES', // CWCC
    ispwAction: 'BuildTask',
    ispwRequestBody: '''buildautomatically = true'''
  }

  stage('Deploy')
  {
    println "Deploy successfull!"
  }
}