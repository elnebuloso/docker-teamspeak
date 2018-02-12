node {
    stage('checkout') {
        checkout scm
    }

    stage('build teamspeak') {
        version_build = "3.0.13.8"
        version1 = "3.0.13"
        version2 = "3.0"
        version3 = "3"

        image = docker.build("elnebuloso/teamspeak:latest", "--build-arg TEAMSPEAK_VERSION=${version_build} --pull --rm --no-cache -f Dockerfile .")

        docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
            image.tag("latest")
            image.push("latest")

            image.tag("${version1}")
            image.push("${version1}")

            image.tag("${version2}")
            image.push("${version2}")

            image.tag("${version3}")
            image.push("${version3}")
        }
    }
}