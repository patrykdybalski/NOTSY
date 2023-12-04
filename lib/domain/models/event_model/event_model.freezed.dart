// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventModel {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  DateTime get selectedDay => throw _privateConstructorUsedError;
  DateTime get selectedTime => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      DateTime selectedDay,
      DateTime selectedTime,
      String id});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? selectedDay = null,
    Object? selectedTime = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedTime: null == selectedTime
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      DateTime selectedDay,
      DateTime selectedTime,
      String id});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? selectedDay = null,
    Object? selectedTime = null,
    Object? id = null,
  }) {
    return _then(_$EventModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedTime: null == selectedTime
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventModelImpl extends _EventModel {
  _$EventModelImpl(
      {required this.title,
      required this.subtitle,
      required this.selectedDay,
      required this.selectedTime,
      required this.id})
      : super._();

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final DateTime selectedDay;
  @override
  final DateTime selectedTime;
  @override
  final String id;

  @override
  String toString() {
    return 'EventModel(title: $title, subtitle: $subtitle, selectedDay: $selectedDay, selectedTime: $selectedTime, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subtitle, selectedDay, selectedTime, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);
}

abstract class _EventModel extends EventModel {
  factory _EventModel(
      {required final String title,
      required final String subtitle,
      required final DateTime selectedDay,
      required final DateTime selectedTime,
      required final String id}) = _$EventModelImpl;
  _EventModel._() : super._();

  @override
  String get title;
  @override
  String get subtitle;
  @override
  DateTime get selectedDay;
  @override
  DateTime get selectedTime;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
