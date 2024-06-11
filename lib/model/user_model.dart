

import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String  profilePics;
  final String banner;
  final String uid;
  final bool isAuthenticated;
  final int karma;
  final List<String> awards;
  UserModel({
    this.name = '',
    this.profilePics = '',
    this.banner = '',
    this.uid = '',
    this.isAuthenticated = false,
    this.karma = 0,
    this.awards = const [],
  });




  UserModel copyWith({
    String? name,
    String? profilePics,
    String? banner,
    String? uid,
    bool? isAuthenticated,
    int? karma,
    List<String>? awards,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePics: profilePics ?? this.profilePics,
      banner: banner ?? this.banner,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      karma: karma ?? this.karma,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePics': profilePics,
      'banner': banner,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'karma': karma,
      'awards': awards,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: (map['name'] ?? '') as String,
      profilePics: (map['profilePics'] ?? '') as String,
      banner: (map['banner'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      isAuthenticated: (map['isAuthenticated'] ?? false) as bool,
      karma: (map['karma'] ?? 0) as int,
      awards: List<String>.from((map['awards'] ?? const <String>[]) as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, profilePics: $profilePics, banner: $banner, uid: $uid, isAuthenticated: $isAuthenticated, karma: $karma, awards: $awards)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profilePics == profilePics &&
      other.banner == banner &&
      other.uid == uid &&
      other.isAuthenticated == isAuthenticated &&
      other.karma == karma &&
      listEquals(other.awards, awards);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profilePics.hashCode ^
      banner.hashCode ^
      uid.hashCode ^
      isAuthenticated.hashCode ^
      karma.hashCode ^
      awards.hashCode;
  }
}
