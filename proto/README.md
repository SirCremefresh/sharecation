### update dependencies lock file

```bash
cd apis
buf mod update
```

### Build docker image

```bash
# multi platform
docker buildx build --platform linux/amd64,linux/arm64 -t proto-generator .
```

### run

```bash
docker buildx build -t proto-generator .
```

### Generate code

```bash
docker run -t --rm -v $(pwd):/tmp/ proto-generator
cp -rf gen/proto/typescript/* ../worker/src/contracts/
cp -rf gen/proto/typescript/* ../admin/src/app/contracts/
```

### Generate code

```bash
docker run -t --rm -v $(pwd):/tmp/ proto-generator buf lint
```
