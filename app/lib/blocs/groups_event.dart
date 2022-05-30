part of 'groups_bloc.dart';

@freezed
class GroupsEvent with _$GroupsEvent {
  const factory GroupsEvent.loadEvent({@Default(false) bool force}) =
      _LoadEvent;

  const factory GroupsEvent.selectEvent({required String groupId}) =
      _SelectEvent;

  const factory GroupsEvent.addEvent({required String name}) = _AddEvent;
}
