// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notebook_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notebook _$NotebookFromJson(Map<String, dynamic> json) {
  return _Notebook.fromJson(json);
}

/// @nodoc
mixin _$Notebook {
  int get id => throw _privateConstructorUsedError;

  String get title => throw _privateConstructorUsedError;

  List<String> get tags => throw _privateConstructorUsedError;

  String? get category => throw _privateConstructorUsedError;

  String? get description => throw _privateConstructorUsedError;

  User get user => throw _privateConstructorUsedError;

  List<User>? get pendingUser => throw _privateConstructorUsedError;

  List<User>? get sharedWith => throw _privateConstructorUsedError;

  List<Note>? get notes => throw _privateConstructorUsedError;

  DateTime? get updatedAt => throw _privateConstructorUsedError;

  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotebookCopyWith<Notebook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotebookCopyWith<$Res> {
  factory $NotebookCopyWith(Notebook value, $Res Function(Notebook) then) =
      _$NotebookCopyWithImpl<$Res, Notebook>;

  @useResult
  $Res call(
      {int id,
      String title,
      List<String> tags,
      String? category,
      String? description,
      User user,
      List<User>? pendingUser,
      List<User>? sharedWith,
      List<Note>? notes,
      DateTime? updatedAt,
      DateTime? createdAt});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$NotebookCopyWithImpl<$Res, $Val extends Notebook>
    implements $NotebookCopyWith<$Res> {
  _$NotebookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? tags = null,
    Object? category = freezed,
    Object? description = freezed,
    Object? user = null,
    Object? pendingUser = freezed,
    Object? sharedWith = freezed,
    Object? notes = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      pendingUser: freezed == pendingUser
          ? _value.pendingUser
          : pendingUser // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      sharedWith: freezed == sharedWith
          ? _value.sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotebookImplCopyWith<$Res>
    implements $NotebookCopyWith<$Res> {
  factory _$$NotebookImplCopyWith(
          _$NotebookImpl value, $Res Function(_$NotebookImpl) then) =
      __$$NotebookImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int id,
      String title,
      List<String> tags,
      String? category,
      String? description,
      User user,
      List<User>? pendingUser,
      List<User>? sharedWith,
      List<Note>? notes,
      DateTime? updatedAt,
      DateTime? createdAt});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$NotebookImplCopyWithImpl<$Res>
    extends _$NotebookCopyWithImpl<$Res, _$NotebookImpl>
    implements _$$NotebookImplCopyWith<$Res> {
  __$$NotebookImplCopyWithImpl(
      _$NotebookImpl _value, $Res Function(_$NotebookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? tags = null,
    Object? category = freezed,
    Object? description = freezed,
    Object? user = null,
    Object? pendingUser = freezed,
    Object? sharedWith = freezed,
    Object? notes = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$NotebookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      pendingUser: freezed == pendingUser
          ? _value._pendingUser
          : pendingUser // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      sharedWith: freezed == sharedWith
          ? _value._sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotebookImpl with DiagnosticableTreeMixin implements _Notebook {
  const _$NotebookImpl(
      {required this.id,
      required this.title,
      required final List<String> tags,
      this.category,
      this.description,
      required this.user,
      final List<User>? pendingUser,
      final List<User>? sharedWith,
      final List<Note>? notes,
      this.updatedAt,
      this.createdAt})
      : _tags = tags,
        _pendingUser = pendingUser,
        _sharedWith = sharedWith,
        _notes = notes;

  factory _$NotebookImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotebookImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  final List<String> _tags;

  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? category;
  @override
  final String? description;
  @override
  final User user;
  final List<User>? _pendingUser;

  @override
  List<User>? get pendingUser {
    final value = _pendingUser;
    if (value == null) return null;
    if (_pendingUser is EqualUnmodifiableListView) return _pendingUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _sharedWith;

  @override
  List<User>? get sharedWith {
    final value = _sharedWith;
    if (value == null) return null;
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
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

  @override
  final DateTime? updatedAt;
  @override
  final DateTime? createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notebook(id: $id, title: $title, tags: $tags, category: $category, description: $description, user: $user, pendingUser: $pendingUser, sharedWith: $sharedWith, notes: $notes, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notebook'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('pendingUser', pendingUser))
      ..add(DiagnosticsProperty('sharedWith', sharedWith))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotebookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._pendingUser, _pendingUser) &&
            const DeepCollectionEquality()
                .equals(other._sharedWith, _sharedWith) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_tags),
      category,
      description,
      user,
      const DeepCollectionEquality().hash(_pendingUser),
      const DeepCollectionEquality().hash(_sharedWith),
      const DeepCollectionEquality().hash(_notes),
      updatedAt,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotebookImplCopyWith<_$NotebookImpl> get copyWith =>
      __$$NotebookImplCopyWithImpl<_$NotebookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotebookImplToJson(
      this,
    );
  }
}

abstract class _Notebook implements Notebook {
  const factory _Notebook(
      {required final int id,
      required final String title,
      required final List<String> tags,
      final String? category,
      final String? description,
      required final User user,
      final List<User>? pendingUser,
      final List<User>? sharedWith,
      final List<Note>? notes,
      final DateTime? updatedAt,
      final DateTime? createdAt}) = _$NotebookImpl;

  factory _Notebook.fromJson(Map<String, dynamic> json) =
      _$NotebookImpl.fromJson;

  @override
  int get id;

  @override
  String get title;

  @override
  List<String> get tags;

  @override
  String? get category;

  @override
  String? get description;

  @override
  User get user;

  @override
  List<User>? get pendingUser;

  @override
  List<User>? get sharedWith;

  @override
  List<Note>? get notes;

  @override
  DateTime? get updatedAt;

  @override
  DateTime? get createdAt;

  @override
  @JsonKey(ignore: true)
  _$$NotebookImplCopyWith<_$NotebookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
