### update dependencies lock file

```bash
cd apis
buf mod update
```

### Build docker image

```bash
# multi platform
docker buildx build --platform linux/amd64,linux/arm64 -t donatowolfisberg/sharecation-proto-builder:latest . --push
```

### Build and Push

```bash
docker buildx build -t donatowolfisberg/sharecation-proto-builder:latest . --push
```

### Generate code

[//]: # (generate code)
```bash
node generate-code.mjs
```

### lint

```bash
docker run -t --rm -v $(pwd):/tmp/ donatowolfisberg/sharecation-proto-builder:master buf lint
```

### format

```bash
docker run -t --rm -v $(pwd):/tmp/ donatowolfisberg/sharecation-proto-builder:master buf format --write
```

### breaking

```bash
docker run -t --rm -v $(pwd):/tmp/ donatowolfisberg/sharecation-proto-builder:master buf breaking --against 'https://github.com/SirCremefresh/sharecation.git#branch=master,subdir=proto'
```
