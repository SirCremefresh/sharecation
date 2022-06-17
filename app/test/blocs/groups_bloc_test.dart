import 'dart:convert';

import 'package:sharecation_app/blocs/main_bloc.dart';
import 'package:test/test.dart';

const sampleGroups = SharecationGroups(
  groups: {
    "some-group-id": SharecationGroup(
      name: 'name',
      groupId: 'group-id',
      images: {
        "some-locale-image": SharecationImage.locale(
          externalId: "external-id",
          path: 'path',
        ),
        "some-remote-image": SharecationImage.remote(
          externalId: "external-id",
          imageId: 'image-id',
          url: 'url',
        ),
        "some-synced-image": SharecationImage.synced(
          externalId: "external-id",
          imageId: 'image-id',
          url: 'url',
          path: 'path',
        ),
      },
    )
  },
);

const sampleGroupsJson =
    '{"groups":{"some-group-id":{"groupId":"group-id","name":"name","images":{"some-locale-image":{"externalId":"external-id","path":"path","type":"locale"},"some-remote-image":{"externalId":"external-id","imageId":"image-id","url":"url","type":"remote"},"some-synced-image":{"externalId":"external-id","imageId":"image-id","url":"url","path":"path","type":"synced"}}}}}';

void main() {
  test('Should format JSON correctly', () {
    final actualJson = jsonEncode(sampleGroups.toJson());

    expect(sampleGroupsJson, actualJson);
  });
  test('Should parse JSON correctly', () {
    final actualGroups =
        SharecationGroups.fromJson(jsonDecode(sampleGroupsJson));

    expect(true, sampleGroups == actualGroups);
    expect(sampleGroups, actualGroups);
  });
}
