#### update dependencies lock file

```bash
buf mod update
```

##### Rdun npm install

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t proto-generator .
docker buildx build -t proto-generator .
docker run -it --rm proto-generator bash
```

### sRun npmda install

```bash
npm install
```
