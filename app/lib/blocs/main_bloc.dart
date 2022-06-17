import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
import 'package:sharecation_app/repositories/groups_file_accessor_repository.dart';
import 'package:sharecation_app/repositories/image_repository.dart';
import 'package:sharecation_app/service/api_service.dart';

part 'main_bloc.freezed.dart';

part 'main_bloc.g.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GroupsFileAccessorRepository fileRepository;

  MainBloc({required this.fileRepository})
      : super(const MainState.loadingState()) {
    on<MainEvent>((event, emit) => event.map(
        loadGroupsForUser: (event) async {
          if (event.loadFromFile) {
            final groups = await fileRepository.read();
            emit(MainState.loadedState(state: groups, userId: event.userId));
          }
          if (event.loadFromServer) {
            var groups = await api.groups.getGroups();
            add(MainEvent.groupsLoaded(
              groups: _mapToSharecationGroups(groups),
            ));
          }
          return null;
        },
        loadGroups: (event) {
          final loadedState = _assertLoadedState();

          add(MainEvent.loadGroupsForUser(userId: loadedState.userId, loadFromServer: event.loadFromServer, loadFromFile: event.loadFromFile));
          return null;
        },
        loadImages: (event) async {
          final loadedState = _assertLoadedState();
          for (var group in loadedState.state.groups.values) {
            loadImagesForGroup(group);
          }
          return null;
        },
        addImage: (event) async {
          _assertLoadedState();
          final sharecationImage =
              await ImageRepository().saveImage(groupId: event.groupId);
          if (sharecationImage == null) return;
          add(MainEvent.imageUpdated(
              groupId: event.groupId, image: sharecationImage));
          return null;
        },
        initialLoad: (event) {
          return null;
        },
        patchImages: (event) async {
          final loadedState = _assertLoadedState();
          final group = loadedState.state.groups[event.groupId]!;
          for (final image in event.images) {
            final storedImage = group.images[image.externalId];
            if (storedImage == null) {
            } else {}
          }
          return null;
        },
        groupsLoaded: (event) async {
          final loadedState = _assertLoadedState();
          final Map<String, SharecationGroup> groups = {};

          for (final group in event.groups) {
            var currentGroup = loadedState.state.groups[group.groupId];
            if (currentGroup != null) {
              groups[group.groupId] = currentGroup;
            } else {
              groups[group.groupId] = group.toGroup();
            }
          }

          emit(MainState.loadedState(
              state: SharecationGroups(groups: groups),
              userId: loadedState.userId));
          return null;
        },
        imageUpdated: (event) async {
          final loadedState = _assertLoadedState();

          final group = loadedState.state.groups[event.groupId]!;

          final Map<String, SharecationImage> newImages = {
            ...group.images,
            event.image.externalId: event.image
          };

          final newGroup = group.copyWith(images: newImages);

          final Map<String, SharecationGroup> groups = {
            ...loadedState.state.groups,
            event.groupId: newGroup
          };

          emit(
            MainState.loadedState(
              state: SharecationGroups(groups: groups),
              userId: loadedState.userId,
            ),
          );
          return null;
        },
        addEvent: (event) async {
          final localState = _assertLoadedState();
          final group = await api.groups.createGroup(groupName: event.name);
          authenticationService.invalidate();

          final newGroups = {
            ...localState.state.groups,
            group.groupId: SharecationGroup(
                groupId: group.groupId, name: group.name, images: {})
          };

          final sharecationGroups = SharecationGroups(groups: newGroups);

          emit(MainState.loadedState(
            state: sharecationGroups,
            userId: localState.userId,
          ));

          add(MainEvent.loadGroupsForUser(
              userId: localState.userId,
              loadFromFile: false,
              loadFromServer: true));
          return null;
        }));
  }

  Future<void> loadImagesForGroup(SharecationGroup group) async {
    final images = (await api.images.getImagesByGroupId(group.groupId))
        .map((e) => SharecationImage.remote(
            externalId: e.externalId, imageId: e.imageId, url: e.url))
        .toList(growable: false);
    for (final image in images) {
      add(MainEvent.imageUpdated(image: image, groupId: group.groupId));
    }
  }

  List<SharecationEmptyGroup> _mapToSharecationGroups(List<Group> groups) {
    return groups
        .map(
          (e) => SharecationEmptyGroup(groupId: e.groupId, name: e.name),
        )
        .toList(growable: false);
  }

  _LoadedState _assertLoadedState() {
    if (state is! _LoadedState) {
      throw Exception("");
    }
    return state as _LoadedState;
  }

  @override
  void onTransition(Transition<MainEvent, MainState> transition) {
    super.onTransition(transition);
    transition.nextState.whenOrNull<void>(loadedState: (state, userId) {
      fileRepository.write(userId: userId, newContent: state);
    });
  }
}
