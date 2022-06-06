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
      if (event.loadFromFile) {
        final groups = await fileRepository.read();
        emit(GroupsState.loadedState(state: groups, userId: event.userId));
      }
      if (event.loadFromServer) {
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

      emit(GroupsState.loadedState(
          state: SharecationGroups(groups: groups),
          userId: loadedState.userId));
    });
    on<_ImageUpdatedEvent>((event, emit) async {
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
      final localState = _assertLoadedState();
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

      add(GroupsEvent.loadGroupsForUser(userId: localState.userId, loadFromFile: false, loadFromServer: true));
    });
  }

  _LoadedState _assertLoadedState() {
    if (state is! _LoadedState) {
      throw Exception("");
    }
    return state as _LoadedState;
  }

  @override
  void onTransition(Transition<GroupsEvent, GroupsState> transition) {
    super.onTransition(transition);
    transition.nextState.whenOrNull<void>(loadedState: (state, userId) {
      fileRepository.write(state);
    });
  }
}
