// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      uri: json['uri'] as String?,
      url: json['url'] as String?,
      id: json['id'] as int?,
      assetId: json['asset_id'] as int?,
      source: json['source'] as String?,
      publishedDate: json['published_date'] as String?,
      updated: json['updated'] as String?,
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      nyTdSection: json['nytdsection'] as String?,
      adxKeywords: json['adx_keywords'] as String?,
      column: json['column'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      desFacet: (json['des_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orgFacet: (json['org_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perFacet: (json['per_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geoFacet: (json['geo_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media:
          (json['media'] as List<dynamic>?)?.map(MediaModel.fromJson).toList(),
      etaId: json['eta_id'] as int?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'url': instance.url,
      'id': instance.id,
      'asset_id': instance.assetId,
      'source': instance.source,
      'published_date': instance.publishedDate,
      'updated': instance.updated,
      'section': instance.section,
      'subsection': instance.subsection,
      'nytdsection': instance.nyTdSection,
      'adx_keywords': instance.adxKeywords,
      'column': instance.column,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'abstract': instance.abstract,
      'des_facet': instance.desFacet,
      'org_facet': instance.orgFacet,
      'per_facet': instance.perFacet,
      'geo_facet': instance.geoFacet,
      'media': instance.media,
      'eta_id': instance.etaId,
    };
