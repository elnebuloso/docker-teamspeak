pipeline {
    agent any

    environment {
        version_build = "3.1.0"
        version_minor = "3.0"
        version_major = "3"
    }

	stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/teamspeak:latest", "--build-arg TEAMSPEAK_VERSION=${version_build} --pull --rm --no-cache -f Dockerfile .")
                }
            }
        }

        stage('push') {
            steps {
                script {
                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${version_build}")
                        image.push("${version_minor}")
                        image.push("${version_major}")
                        image.push("latest")
                    }
                }
            }
        }
	}

	post {
	    always {
            cleanWs()
	    }
	}
}