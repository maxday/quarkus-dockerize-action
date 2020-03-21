# quarkus-native-build-docker-action


# quarkus-dockerize action

Action to embed a native executable into a Docker image.

A default Dockerfile is used but you can specify a custom Docker via the *dockerfilePath* option.

A tagged Docker container will be generated.

### Parameters

| Argument   | Description |
|--------|-------------|
| executablePath  | Path to the Quarkus executable you want to put in the docker image. _Required_  |
| tag  | Docker tag to set once the image is built. _Required_  |
| dockerfilePath  | Path to the Dockerfile you want to use - leave blank for default. _Optional_  |

### Exemple d'utilisation

```
on: [push]

jobs:
  dockerize
     ...
      - name: Dockerize
        uses: maxday/quarkus-dockerize-action@master
        with:
          tag: maxday/myApp
          executablePath: myApp-runner

```
