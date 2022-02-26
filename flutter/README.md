# sharecation

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# Run code generator
```shell
flutter pub run build_runner build
```

````shell
docker run --rm -v "/Users/donatowolfisberg/git/sharecation:/local" openapitools/openapi-generator-cli generate \
    -i /local/sharecation-api.yaml \
    -g dart \
    -o /local/sharecation-api
````

```shell
openapi-generator-cli generate \
    -i sharecation-api.yaml \
    -g dart-dio-next \
    -o sharecation-api \
    --additional-properties=pubName=sharecation_api
```
