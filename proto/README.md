### update dependencies lock file

```bash
buf mod update
```

### Build docker image

```bash
# multi platform
docker buildx build --platform linux/amd64,linux/arm64 -t proto-generator .
```

```bash
docker buildx build -t proto-generator .
```

### Generate code

```bash
docker run -it --rm -v $(pwd):/tmp/  proto-generator bash
cd tmp && buf generate
exit
cp -rf gen/proto/typescript/* ../worker/src/contracts/
cp -rf gen/proto/typescript/* ../admin/src/app/contracts/
```
