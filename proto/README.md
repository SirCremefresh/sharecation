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
docker run -t --rm -v $(pwd):/tmp/ proto-generator buf lint
```

### format

```bash
docker run -t --rm -v $(pwd):/tmp/ proto-generator buf format --write
```
