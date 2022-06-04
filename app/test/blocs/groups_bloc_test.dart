import 'dart:convert';

import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:test/test.dart';

void main() {
  test('Should format JSON correctly', () {
    const sharecationImage = SharecationImage(localId: "localId");
    const group = SharecationGroup(images: {"some-image-id": sharecationImage});
    const groups = SharecationGroups(groups: {"some-group-id": group});

    final res = jsonEncode(groups.toJson());

    expect(res,
        '{"groups":{"some-group-id":{"images":{"some-image-id":{"localId":"localId"}}}}}');
  });
  test('Should parse JSON correctly', () {
    const json =
        '{"groups":{"some-group-id":{"images":{"some-image-id":{"localId":"localId"}}}}}';
    final actualGroups = SharecationGroups.fromJson(jsonDecode(json));
    const expectedGroups = SharecationGroups(
      groups: {
        "some-group-id": SharecationGroup(
          images: {
            "some-image-id": SharecationImage(localId: "localId"),
          },
        )
      },
    );

    expect(actualGroups, expectedGroups);
  });
}
