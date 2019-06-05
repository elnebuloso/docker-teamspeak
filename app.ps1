param(
    [string]$command = ""
)

$tag = "teamspeak"
$pwd = [string](Get-Location)
$pwd = $pwd.Replace("\", "/")

if ($command -eq "build") {
    $version = Get-Content "${pwd}\VERSION"
    docker build --rm --pull --tag ${tag} --build-arg TEAMSPEAK_VERSION=${version} --file Dockerfile .
}

if ($command -eq "run") {
    docker run --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 --name ${tag} ${tag}
}

if ($command -eq "stop") {
    docker rm -f ${tag}
}