node {
    stage('checkout') {
        checkout scm
    }

    stage('build teamspeak') {
        version = "3.0.13.8"

        image = docker.build("elnebuloso/teamspeak:${version}", "--build-arg TEAMSPEAK_VERSION=${version} --pull --rm --no-cache -f Dockerfile .")

        docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
            image.tag("3.0.13")
            image.push("3.0.13")

            image.tag("3.0")
            image.push("3.0")

            image.tag("3")
            image.push("3")
        }
    }
}