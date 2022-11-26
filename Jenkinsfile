pipeline {
  agent any
  stages {
    stage ('build') {
      steps {
        sh 'printenv' 
      }
    }
    stage ('Publish ECR') {
      steps {
        withEnv (["AWS_ACCESS_KEY=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}", "AWS_ACCOUNT_ID=${env.AWS_ACCOUNT_ID}", "AWS_ECR_REPO_NAME=${env.AWS_ECR_REPO_NAME}"]) {
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region ap-northeast-2) $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com'
          sh 'docker build -t $AWS_ECR_REPO_NAME .'
          sh 'docker tag $AWS_ECR_REPO_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$AWS_ECR_REPO_NAME:""$BUILD_ID""'
          sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$AWS_ECR_REPO_NAME:""$BUILD_ID""'
        }
      }
    }
  }
}