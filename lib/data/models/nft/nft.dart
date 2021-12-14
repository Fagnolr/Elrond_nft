import 'dart:convert';

import 'package:equatable/equatable.dart';

class Nft extends Equatable {
  final String? identifier;
  final String? collection;
  final String? attributes;
  final int? nonce;
  final String? type;
  final String? name;
  final String? creator;
  final dynamic royalties;
  final List<dynamic>? uris;
  final String? url;
  final bool? isWhitelistedStorage;
  final String? thumbnailUrl;
  final String? balance;
  final String? ticker;

  const Nft({
    this.identifier,
    this.collection,
    this.attributes,
    this.nonce,
    this.type,
    this.name,
    this.creator,
    this.royalties,
    this.uris,
    this.url,
    this.isWhitelistedStorage,
    this.thumbnailUrl,
    this.balance,
    this.ticker,
  });

  factory Nft.fromMap(Map<String, dynamic> data) => Nft(
        identifier: data['identifier'] as String?,
        collection: data['collection'] as String?,
        attributes: data['attributes'] as String?,
        nonce: data['nonce'] as int?,
        type: data['type'] as String?,
        name: data['name'] as String?,
        creator: data['creator'] as String?,
        royalties: data['royalties'] as dynamic,
        uris: data['uris'] as List<dynamic>?,
        url: data['url'] as String?,
        isWhitelistedStorage: data['isWhitelistedStorage'] as bool?,
        thumbnailUrl: data['thumbnailUrl'] as String?,
        balance: data['balance'] as String?,
        ticker: data['ticker'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'identifier': identifier,
        'collection': collection,
        'attributes': attributes,
        'nonce': nonce,
        'type': type,
        'name': name,
        'creator': creator,
        'royalties': royalties,
        'uris': uris,
        'url': url,
        'isWhitelistedStorage': isWhitelistedStorage,
        'thumbnailUrl': thumbnailUrl,
        'balance': balance,
        'ticker': ticker,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Nft].
  factory Nft.fromJson(String data) {
    return Nft.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Nft] to a JSON string.
  String toJson() => json.encode(toMap());

  Nft copyWith({
    String? identifier,
    String? collection,
    String? attributes,
    int? nonce,
    String? type,
    String? name,
    String? creator,
    dynamic royalties,
    List<String>? uris,
    String? url,
    bool? isWhitelistedStorage,
    String? thumbnailUrl,
    String? balance,
    String? ticker,
  }) {
    return Nft(
      identifier: identifier ?? this.identifier,
      collection: collection ?? this.collection,
      attributes: attributes ?? this.attributes,
      nonce: nonce ?? this.nonce,
      type: type ?? this.type,
      name: name ?? this.name,
      creator: creator ?? this.creator,
      royalties: royalties ?? this.royalties,
      uris: uris ?? this.uris,
      url: url ?? this.url,
      isWhitelistedStorage: isWhitelistedStorage ?? this.isWhitelistedStorage,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      balance: balance ?? this.balance,
      ticker: ticker ?? this.ticker,
    );
  }

  @override
  List<Object?> get props {
    return [
      identifier,
      collection,
      attributes,
      nonce,
      type,
      name,
      creator,
      royalties,
      uris,
      url,
      isWhitelistedStorage,
      thumbnailUrl,
      balance,
      ticker,
    ];
  }
}
