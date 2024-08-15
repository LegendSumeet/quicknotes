// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Note _$NoteFromJson(Map<String, dynamic> json) {
  return _Note.fromJson(json);
}

/// @nodoc
mixin _$Note {
  int get id => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<User>? get sharedWith => throw _privateConstructorUsedError;
  List<User>? get pendingUser => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Notebook? get notebook => throw _privateConstructorUsedError;

  /// Serializes this Note to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call(
      {int id,
      List<String>? tags,
      String? category,
      String title,
      String content,
      String? description,
      User? user,
      List<User>? sharedWith,
      List<User>? pendingUser,
      DateTime? updatedAt,
      DateTime? createdAt,
      Notebook? notebook});

  $UserCopyWith<$Res>? get user;
  $NotebookCopyWith<$Res>? get notebook;
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tags = freezed,
    Object? category = freezed,
    Object? title = null,
    Object? content = null,
    Object? description = freezed,
    Object? user = freezed,
    Object? sharedWith = freezed,
    Object? pendingUser = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? notebook = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      sharedWith: freezed == sharedWith
          ? _value.sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      pendingUser: freezed == pendingUser
          ? _value.pendingUser
          : pendingUser // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notebook: freezed == notebook
          ? _value.notebook
          : notebook // ignore: cast_nullable_to_non_nullable
              as Notebook?,
    ) as $Val);
  }

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotebookCopyWith<$Res>? get notebook {
    if (_value.notebook == null) {
      return null;
    }

    return $NotebookCopyWith<$Res>(_value.notebook!, (value) {
      return _then(_value.copyWith(notebook: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<String>? tags,
      String? category,
      String title,
      String content,
      String? description,
      User? user,
      List<User>? sharedWith,
      List<User>? pendingUser,
      DateTime? updatedAt,
      DateTime? createdAt,
      Notebook? notebook});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $NotebookCopyWith<$Res>? get notebook;
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NoteCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tags = freezed,
    Object? category = freezed,
    Object? title = null,
    Object? content = null,
    Object? description = freezed,
    Object? user = freezed,
    Object? sharedWith = freezed,
    Object? pendingUser = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? notebook = freezed,
  }) {
    return _then(_$NoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      sharedWith: freezed == sharedWith
          ? _value._sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      pendingUser: freezed == pendingUser
          ? _value._pendingUser
          : pendingUser // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notebook: freezed == notebook
          ? _value.notebook
          : notebook // ignore: cast_nullable_to_non_nullable
              as Notebook?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NoteImpl with DiagnosticableTreeMixin implements _Note {
  const _$NoteImpl(
      {required this.id,
      final List<String>? tags,
      this.category,
      required this.title,
      required this.content,
      this.description,
      this.user,
      final List<User>? sharedWith,
      final List<User>? pendingUser,
      this.updatedAt,
      this.createdAt,
      this.notebook})
      : _tags = tags,
        _sharedWith = sharedWith,
        _pendingUser = pendingUser;

  factory _$NoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteImplFromJson(json);

  @override
  final int id;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? category;
  @override
  final String title;
  @override
  final String content;
  @override
  final String? description;
  @override
  final User? user;
  final List<User>? _sharedWith;
  @override
  List<User>? get sharedWith {
    final value = _sharedWith;
    if (value == null) return null;
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _pendingUser;
  @override
  List<User>? get pendingUser {
    final value = _pendingUser;
    if (value == null) return null;
    if (_pendingUser is EqualUnmodifiableListView) return _pendingUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? updatedAt;
  @override
  final DateTime? createdAt;
  @override
  final Notebook? notebook;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Note(id: $id, tags: $tags, category: $category, title: $title, content: $content, description: $description, user: $user, sharedWith: $sharedWith, pendingUser: $pendingUser, updatedAt: $updatedAt, createdAt: $createdAt, notebook: $notebook)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Note'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('sharedWith', sharedWith))
      ..add(DiagnosticsProperty('pendingUser', pendingUser))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('notebook', notebook));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._sharedWith, _sharedWith) &&
            const DeepCollectionEquality()
                .equals(other._pendingUser, _pendingUser) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notebook, notebook) ||
                other.notebook == notebook));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_tags),
      category,
      title,
      content,
      description,
      user,
      const DeepCollectionEquality().hash(_sharedWith),
      const DeepCollectionEquality().hash(_pendingUser),
      updatedAt,
      createdAt,
      notebook);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteImplToJson(
      this,
    );
  }
}

abstract class _Note implements Note {
  const factory _Note(
      {required final int id,
      final List<String>? tags,
      final String? category,
      required final String title,
      required final String content,
      final String? description,
      final User? user,
      final List<User>? sharedWith,
      final List<User>? pendingUser,
      final DateTime? updatedAt,
      final DateTime? createdAt,
      final Notebook? notebook}) = _$NoteImpl;

  factory _Note.fromJson(Map<String, dynamic> json) = _$NoteImpl.fromJson;

  @override
  int get id;
  @override
  List<String>? get tags;
  @override
  String? get category;
  @override
  String get title;
  @override
  String get content;
  @override
  String? get description;
  @override
  User? get user;
  @override
  List<User>? get sharedWith;
  @override
  List<User>? get pendingUser;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get createdAt;
  @override
  Notebook? get notebook;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
