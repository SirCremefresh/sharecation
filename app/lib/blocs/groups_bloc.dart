import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/repositories/groups_file_accessor_repository.dart';
import 'package:sharecation_app/service/api_service.dart';

part 'groups_bloc.freezed.dart';

part 'groups_bloc.g.dart';

part 'groups_event.dart';

part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final GroupsFileAccessorRepository fileRepository;

  GroupsBloc({required this.fileRepository})
      : super(const GroupsState.loadingState()) {
    on<_LoadGroupsForUser>((event, emit) async {
      {
        final groups = await fileRepository.read();
        emit(GroupsState.loadedState(state: groups, userId: event.userId));
      }
      {
        var groups = await api.groups.getGroups();
        add(
          GroupsEvent.groupsLoaded(
            groups: groups
                .map(
                  (e) =>
                      SharecationEmptyGroup(groupId: e.groupId, name: e.name),
                )
                .toList(growable: false),
          ),
        );
      }
    });
    on<_GroupsLoadedEvent>((event, emit) async {
      final loadedState = assertLoadedState();
      final Map<String, SharecationGroup> groups = {};

      for (final group in event.groups) {
        var currentGroup = loadedState.state.groups[group.groupId];
        if (currentGroup != null) {
          groups[group.groupId] = currentGroup;
        } else {
          groups[group.groupId] = group.toGroup();
        }
      }

      emit(GroupsState.loadedState(
          state: SharecationGroups(groups: groups),
          userId: loadedState.userId));
    });
    on<_ImageUpdatedEvent>((event, emit) async {
      final loadedState = assertLoadedState();

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
        GroupsState.loadedState(
          state: SharecationGroups(groups: groups),
          userId: loadedState.userId,
        ),
      );
    });
    // on<_LoadEvent>((event, emit) async {
    //   if (event.force) {
    //     authenticationService.invalidate();
    //   }
    //   var groups = await api.groups.getGroups();
    //   var activeGroup = groups[0];
    //   emit(GroupsState.loadedState(groups: groups, activeGroup: activeGroup));
    //   imagesBloc.add(ImagesEvent.loadEvent(groupId: activeGroup.groupId));
    // });
    on<_AddEvent>((event, emit) async {
      final localState = assertLoadedState();
      final group = await api.groups.createGroup(groupName: event.name);
      authenticationService.invalidate();

      final newGroups = {
        ...localState.state.groups,
        group.groupId: SharecationGroup(
            groupId: group.groupId, name: group.name, images: {})
      };

      final sharecationGroups = SharecationGroups(groups: newGroups);
      fileRepository.write(sharecationGroups);

      emit(
        GroupsState.loadedState(
          state: sharecationGroups,
          userId: localState.userId,
        ),
      );

      add(GroupsEvent.loadGroupsForUser(userId: localState.userId));
    });
    // on<_SelectEvent>((event, emit) async {
    //   if (state is _LoadedState) {
    //     final groupsLoaded = state as _LoadedState;
    //     final activeGroup = groupsLoaded.groups
    //         .firstWhere((element) => element.groupId == event.groupId);
    //
    //     emit(GroupsState.loadedState(
    //         groups: groupsLoaded.groups, activeGroup: activeGroup));
    //     imagesBloc.add(ImagesEvent.loadEvent(groupId: activeGroup.groupId));
    //   }
    // });
  }

  _LoadedState assertLoadedState() {
    if (state is! _LoadedState) {
      throw Exception("");
    }
    return state as _LoadedState;
  }
}
