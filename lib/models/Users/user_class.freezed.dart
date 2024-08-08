// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;

  String get email => throw _privateConstructorUsedError;

  String? get name => throw _privateConstructorUsedError;

  List<Note>? get sharedNotes => throw _privateConstructorUsedError;

  List<Note>? get notes => throw _privateConstructorUsedError;

  List<Note>? get pendingNotes => throw _privateConstructorUsedError;

  DateTime? get updatedAt => throw _privateConstructorUsedError;

  DateTime? get createdAt => throw _privateConstructorUsedError;

  List<Notebook>? get notebooks => throw _privateConstructorUsedError;

  List<Notebook>? get pendingUser => throw _privateConstructorUsedError;

  List<Notebook>? get sharedNotebooks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;

  @useResult
  $Res call(
      {int id,
      String email,
      String? name,
      List<Note>? sharedNotes,
      List<Note>? notes,
      List<Note>? pendingNotes,
      DateTime? updatedAt,
      DateTime? createdAt,
      List<Notebook>? notebooks,
      List<Notebook>? pendingUser,
      List<Notebook>? sharedNotebooks});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? sharedNotes = freezed,
    Object? notes = freezed,
    Object? pendingNotes = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? notebooks = freezed,
    Object? pendingUser = freezed,
    Object? sharedNotebooks = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sharedNotes: freezed == sharedNotes
          ? _value.sharedNotes
          : sharedNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      pendingNotes: freezed == pendingNotes
          ? _value.pendingNotes
          : pendingNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notebooks: freezed == notebooks
          ? _value.notebooks
          : notebooks // ignore: cast_nullable_to_non_nullable
              as List<Notebook>?,
      pendingUser: freezed == pendingUser
          ? _value.pendingUser
          : pendingUser // ignore: cast_nullable_to_non_nullable
              as List<Notebook>?,
      sharedNotebooks: freezed == sharedNotebooks
          ? _value.sharedNotebooks
          : sharedNotebooks // ignore: cast_nullable_to_non_nullable
              as List<Notebook>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String? name,
      List<Note>? sharedNotes,
      List<Note>? notes,
      List<Note>? pendingNotes,
      DateTime? updatedAt,
      DateTime? createdAt,
      List<Notebook>? notebooks,
      List<Notebook>? pendingUser,
      List<Notebook>? sharedNotebooks});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? sharedNotes = freezed,
    Object? notes = freezed,
    Object? pendingNotes = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? notebooks = freezed,
    Object? pendingUser = freezed,
    Object? sharedNotebooks = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sharedNotes: freezed == sharedNotes
          ? _value._sharedNotes
          : sharedNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      pendingNotes: freezed == pendingNotes
          ? _value._pendingNotes
          : pendingNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notebooks: freezed == notebooks
          ? _value._notebooks
          : notebooks // ignore: cast_nullable_to_non_nullable
              as List<Notebook>?,
      pendingUser: freezed == pendingUser
          ? _value._pendingUser
          : pendingUser // ignore: cast_nullable_to_non_nullable
              as List<Notebook>?,
      sharedNotebooks: freezed == sharedNotebooks
          ? _value._sharedNotebooks
          : sharedNotebooks // ignore: cast_nullable_to_non_nullable
              as List<Notebook>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      this.name,
      final List<Note>? sharedNotes,
      final List<Note>? notes,
      final List<Note>? pendingNotes,
      this.updatedAt,
      this.createdAt,
      final List<Notebook>? notebooks,
      final List<Notebook>? pendingUser,
      final List<Notebook>? sharedNotebooks})
      : _sharedNotes = sharedNotes,
        _notes = notes,
        _pendingNotes = pendingNotes,
        _notebooks = notebooks,
        _pendingUser = pendingUser,
        _sharedNotebooks = sharedNotebooks;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String? name;
  final List<Note>? _sharedNotes;

  @override
  List<Note>? get sharedNotes {
    final value = _sharedNotes;
    if (value == null) return null;
    if (_sharedNotes is EqualUnmodifiableListView) return _sharedNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Note>? _notes;

  @override
  List<Note>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Note>? _pendingNotes;

  @override
  List<Note>? get pendingNotes {
    final value = _pendingNotes;
    if (value == null) return null;
    if (_pendingNotes is EqualUnmodifiableListView) return _pendingNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? updatedAt;
  @override
  final DateTime? createdAt;
  final List<Notebook>? _notebooks;

  @override
  List<Notebook>? get notebooks {
    final value = _notebooks;
    if (value == null) return null;
    if (_notebooks is EqualUnmodifiableListView) return _notebooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Notebook>? _pendingUser;

  @override
  List<Notebook>? get pendingUser {
    final value = _pendingUser;
    if (value == null) return null;
    if (_pendingUser is EqualUnmodifiableListView) return _pendingUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Notebook>? _sharedNotebooks;

  @override
  List<Notebook>? get sharedNotebooks {
    final value = _sharedNotebooks;
    if (value == null) return null;
    if (_sharedNotebooks is EqualUnmodifiableListView) return _sharedNotebooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, email: $email, name: $name, sharedNotes: $sharedNotes, notes: $notes, pendingNotes: $pendingNotes, updatedAt: $updatedAt, createdAt: $createdAt, notebooks: $notebooks, pendingUser: $pendingUser, sharedNotebooks: $sharedNotebooks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('sharedNotes', sharedNotes))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('pendingNotes', pendingNotes))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('notebooks', notebooks))
      ..add(DiagnosticsProperty('pendingUser', pendingUser))
      ..add(DiagnosticsProperty('sharedNotebooks', sharedNotebooks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._sharedNotes, _sharedNotes) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality()
                .equals(other._pendingNotes, _pendingNotes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._notebooks, _notebooks) &&
            const DeepCollectionEquality()
                .equals(other._pendingUser, _pendingUser) &&
            const DeepCollectionEquality()
                .equals(other._sharedNotebooks, _sharedNotebooks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      const DeepCollectionEquality().hash(_sharedNotes),
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_pendingNotes),
      updatedAt,
      createdAt,
      const DeepCollectionEquality().hash(_notebooks),
      const DeepCollectionEquality().hash(_pendingUser),
      const DeepCollectionEquality().hash(_sharedNotebooks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String email,
      final String? name,
      final List<Note>? sharedNotes,
      final List<Note>? notes,
      final List<Note>? pendingNotes,
      final DateTime? updatedAt,
      final DateTime? createdAt,
      final List<Notebook>? notebooks,
      final List<Notebook>? pendingUser,
      final List<Notebook>? sharedNotebooks}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;

  @override
  String get email;

  @override
  String? get name;

  @override
  List<Note>? get sharedNotes;

  @override
  List<Note>? get notes;

  @override
  List<Note>? get pendingNotes;

  @override
  DateTime? get updatedAt;

  @override
  DateTime? get createdAt;

  @override
  List<Notebook>? get notebooks;

  @override
  List<Notebook>? get pendingUser;

  @override
  List<Notebook>? get sharedNotebooks;

  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
