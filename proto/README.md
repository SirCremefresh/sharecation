#### update dependencies lock file

```bash
buf mod update
```

##### Rdun npm install

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t proto-generator .
docker buildx build -t proto-generator .
docker run -it --rm proto-generator bash

docker run -it --rm -v $(pwd):/tmp/  proto-generator bash

cd tmp
buf generate
```

### sRun npmda install

```bash
npm install
```
