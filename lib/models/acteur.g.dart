// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acteur.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActeurCollection on Isar {
  IsarCollection<Acteur> get acteurs => this.collection();
}

const ActeurSchema = CollectionSchema(
  name: r'Acteur',
  id: -445274741437089179,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'deces': PropertySchema(
      id: 1,
      name: r'deces',
      type: IsarType.dateTime,
    ),
    r'drapeauUnicode': PropertySchema(
      id: 2,
      name: r'drapeauUnicode',
      type: IsarType.string,
    ),
    r'metaphone': PropertySchema(
      id: 3,
      name: r'metaphone',
      type: IsarType.string,
    ),
    r'naissance': PropertySchema(
      id: 4,
      name: r'naissance',
      type: IsarType.dateTime,
    ),
    r'nationalite': PropertySchema(
      id: 5,
      name: r'nationalite',
      type: IsarType.string,
    ),
    r'nbFilm': PropertySchema(
      id: 6,
      name: r'nbFilm',
      type: IsarType.long,
    ),
    r'nom': PropertySchema(
      id: 7,
      name: r'nom',
      type: IsarType.string,
    ),
    r'personneId': PropertySchema(
      id: 8,
      name: r'personneId',
      type: IsarType.long,
    ),
    r'popularite': PropertySchema(
      id: 9,
      name: r'popularite',
      type: IsarType.double,
    )
  },
  estimateSize: _acteurEstimateSize,
  serialize: _acteurSerialize,
  deserialize: _acteurDeserialize,
  deserializeProp: _acteurDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _acteurGetId,
  getLinks: _acteurGetLinks,
  attach: _acteurAttach,
  version: '3.1.0+1',
);

int _acteurEstimateSize(
  Acteur object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.drapeauUnicode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.metaphone.length * 3;
  {
    final value = object.nationalite;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nom.length * 3;
  return bytesCount;
}

void _acteurSerialize(
  Acteur object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeDateTime(offsets[1], object.deces);
  writer.writeString(offsets[2], object.drapeauUnicode);
  writer.writeString(offsets[3], object.metaphone);
  writer.writeDateTime(offsets[4], object.naissance);
  writer.writeString(offsets[5], object.nationalite);
  writer.writeLong(offsets[6], object.nbFilm);
  writer.writeString(offsets[7], object.nom);
  writer.writeLong(offsets[8], object.personneId);
  writer.writeDouble(offsets[9], object.popularite);
}

Acteur _acteurDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Acteur(
    age: reader.readLongOrNull(offsets[0]),
    deces: reader.readDateTimeOrNull(offsets[1]),
    drapeauUnicode: reader.readStringOrNull(offsets[2]),
    metaphone: reader.readString(offsets[3]),
    naissance: reader.readDateTimeOrNull(offsets[4]),
    nationalite: reader.readStringOrNull(offsets[5]),
    nbFilm: reader.readLong(offsets[6]),
    nom: reader.readString(offsets[7]),
    personneId: reader.readLong(offsets[8]),
    popularite: reader.readDouble(offsets[9]),
  );
  object.id = id;
  return object;
}

P _acteurDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _acteurGetId(Acteur object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _acteurGetLinks(Acteur object) {
  return [];
}

void _acteurAttach(IsarCollection<dynamic> col, Id id, Acteur object) {
  object.id = id;
}

extension ActeurQueryWhereSort on QueryBuilder<Acteur, Acteur, QWhere> {
  QueryBuilder<Acteur, Acteur, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActeurQueryWhere on QueryBuilder<Acteur, Acteur, QWhereClause> {
  QueryBuilder<Acteur, Acteur, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActeurQueryFilter on QueryBuilder<Acteur, Acteur, QFilterCondition> {
  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> ageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> decesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deces',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> decesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deces',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> decesEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deces',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> decesGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deces',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> decesLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deces',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> decesBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deces',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'drapeauUnicode',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition>
      drapeauUnicodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'drapeauUnicode',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drapeauUnicode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drapeauUnicode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drapeauUnicode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drapeauUnicode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'drapeauUnicode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'drapeauUnicode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'drapeauUnicode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'drapeauUnicode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> drapeauUnicodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drapeauUnicode',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition>
      drapeauUnicodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'drapeauUnicode',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metaphone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metaphone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metaphone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metaphone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metaphone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metaphone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metaphone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metaphone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metaphone',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> metaphoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metaphone',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> naissanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'naissance',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> naissanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'naissance',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> naissanceEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'naissance',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> naissanceGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'naissance',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> naissanceLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'naissance',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> naissanceBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'naissance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationalite',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationalite',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationalite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationalite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationalite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationalite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationalite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationalite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationalite',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalite',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nationaliteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationalite',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nbFilmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbFilm',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nbFilmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbFilm',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nbFilmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbFilm',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nbFilmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbFilm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> nomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nom',
        value: '',
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> personneIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personneId',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> personneIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'personneId',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> personneIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'personneId',
        value: value,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> personneIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'personneId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> populariteEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'popularite',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> populariteGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'popularite',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> populariteLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'popularite',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterFilterCondition> populariteBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'popularite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ActeurQueryObject on QueryBuilder<Acteur, Acteur, QFilterCondition> {}

extension ActeurQueryLinks on QueryBuilder<Acteur, Acteur, QFilterCondition> {}

extension ActeurQuerySortBy on QueryBuilder<Acteur, Acteur, QSortBy> {
  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByDeces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deces', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByDecesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deces', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByDrapeauUnicode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drapeauUnicode', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByDrapeauUnicodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drapeauUnicode', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByMetaphone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metaphone', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByMetaphoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metaphone', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naissance', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNaissanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naissance', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNationalite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalite', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNationaliteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalite', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNbFilm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbFilm', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNbFilmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbFilm', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByPersonneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneId', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByPersonneIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneId', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByPopularite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularite', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> sortByPopulariteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularite', Sort.desc);
    });
  }
}

extension ActeurQuerySortThenBy on QueryBuilder<Acteur, Acteur, QSortThenBy> {
  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByDeces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deces', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByDecesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deces', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByDrapeauUnicode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drapeauUnicode', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByDrapeauUnicodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drapeauUnicode', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByMetaphone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metaphone', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByMetaphoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metaphone', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naissance', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNaissanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naissance', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNationalite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalite', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNationaliteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalite', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNbFilm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbFilm', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNbFilmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbFilm', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByPersonneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneId', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByPersonneIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneId', Sort.desc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByPopularite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularite', Sort.asc);
    });
  }

  QueryBuilder<Acteur, Acteur, QAfterSortBy> thenByPopulariteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularite', Sort.desc);
    });
  }
}

extension ActeurQueryWhereDistinct on QueryBuilder<Acteur, Acteur, QDistinct> {
  QueryBuilder<Acteur, Acteur, QDistinct> distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByDeces() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deces');
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByDrapeauUnicode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'drapeauUnicode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByMetaphone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metaphone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'naissance');
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByNationalite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationalite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByNbFilm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nbFilm');
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByNom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByPersonneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personneId');
    });
  }

  QueryBuilder<Acteur, Acteur, QDistinct> distinctByPopularite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'popularite');
    });
  }
}

extension ActeurQueryProperty on QueryBuilder<Acteur, Acteur, QQueryProperty> {
  QueryBuilder<Acteur, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Acteur, int?, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<Acteur, DateTime?, QQueryOperations> decesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deces');
    });
  }

  QueryBuilder<Acteur, String?, QQueryOperations> drapeauUnicodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drapeauUnicode');
    });
  }

  QueryBuilder<Acteur, String, QQueryOperations> metaphoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metaphone');
    });
  }

  QueryBuilder<Acteur, DateTime?, QQueryOperations> naissanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'naissance');
    });
  }

  QueryBuilder<Acteur, String?, QQueryOperations> nationaliteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationalite');
    });
  }

  QueryBuilder<Acteur, int, QQueryOperations> nbFilmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nbFilm');
    });
  }

  QueryBuilder<Acteur, String, QQueryOperations> nomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nom');
    });
  }

  QueryBuilder<Acteur, int, QQueryOperations> personneIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personneId');
    });
  }

  QueryBuilder<Acteur, double, QQueryOperations> populariteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'popularite');
    });
  }
}
