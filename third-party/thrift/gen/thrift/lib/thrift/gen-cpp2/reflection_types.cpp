/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#include "thrift/lib/thrift/gen-cpp2/reflection_types.h"
#include "thrift/lib/thrift/gen-cpp2/reflection_types.tcc"

#include <thrift/lib/cpp2/gen/module_types_cpp.h>

#include "thrift/lib/thrift/gen-cpp2/reflection_data.h"


namespace apache { namespace thrift {

constexpr std::size_t const TEnumTraits<::apache::thrift::reflection::Type>::size;
folly::Range<::apache::thrift::reflection::Type const*> const TEnumTraits<::apache::thrift::reflection::Type>::values = folly::range(::apache::thrift::reflection::_TypeEnumDataStorage::values);
folly::Range<folly::StringPiece const*> const TEnumTraits<::apache::thrift::reflection::Type>::names = folly::range(::apache::thrift::reflection::_TypeEnumDataStorage::names);

char const* TEnumTraits<::apache::thrift::reflection::Type>::findName(type value) {
  using factory = ::apache::thrift::reflection::_Type_EnumMapFactory;
  static folly::Indestructible<factory::ValuesToNamesMapType> const map{
      factory::makeValuesToNamesMap()};
  auto found = map->find(value);
  return found == map->end() ? nullptr : found->second;
}

bool TEnumTraits<::apache::thrift::reflection::Type>::findValue(char const* name, type* out) {
  using factory = ::apache::thrift::reflection::_Type_EnumMapFactory;
  static folly::Indestructible<factory::NamesToValuesMapType> const map{
      factory::makeNamesToValuesMap()};
  auto found = map->find(name);
  return found == map->end() ? false : (*out = found->second, true);
}

}} // apache::thrift

namespace apache { namespace thrift { namespace reflection {

const _Type_EnumMapFactory::ValuesToNamesMapType _Type_VALUES_TO_NAMES = _Type_EnumMapFactory::makeValuesToNamesMap();
const _Type_EnumMapFactory::NamesToValuesMapType _Type_NAMES_TO_VALUES = _Type_EnumMapFactory::makeNamesToValuesMap();

}}} // apache::thrift::reflection

namespace apache {
namespace thrift {
namespace detail {

void TccStructTraits<::apache::thrift::reflection::StructField>::translateFieldName(
    FOLLY_MAYBE_UNUSED folly::StringPiece _fname,
    FOLLY_MAYBE_UNUSED int16_t& fid,
    FOLLY_MAYBE_UNUSED apache::thrift::protocol::TType& _ftype) {
  if (false) {}
  else if (_fname == "isRequired") {
    fid = 1;
    _ftype = apache::thrift::protocol::T_BOOL;
  }
  else if (_fname == "type") {
    fid = 2;
    _ftype = apache::thrift::protocol::T_I64;
  }
  else if (_fname == "name") {
    fid = 3;
    _ftype = apache::thrift::protocol::T_STRING;
  }
  else if (_fname == "annotations") {
    fid = 4;
    _ftype = apache::thrift::protocol::T_MAP;
  }
  else if (_fname == "order") {
    fid = 5;
    _ftype = apache::thrift::protocol::T_I16;
  }
}
void TccStructTraits<::apache::thrift::reflection::DataType>::translateFieldName(
    FOLLY_MAYBE_UNUSED folly::StringPiece _fname,
    FOLLY_MAYBE_UNUSED int16_t& fid,
    FOLLY_MAYBE_UNUSED apache::thrift::protocol::TType& _ftype) {
  if (false) {}
  else if (_fname == "name") {
    fid = 1;
    _ftype = apache::thrift::protocol::T_STRING;
  }
  else if (_fname == "fields") {
    fid = 2;
    _ftype = apache::thrift::protocol::T_MAP;
  }
  else if (_fname == "mapKeyType") {
    fid = 3;
    _ftype = apache::thrift::protocol::T_I64;
  }
  else if (_fname == "valueType") {
    fid = 4;
    _ftype = apache::thrift::protocol::T_I64;
  }
  else if (_fname == "enumValues") {
    fid = 5;
    _ftype = apache::thrift::protocol::T_MAP;
  }
}
void TccStructTraits<::apache::thrift::reflection::Schema>::translateFieldName(
    FOLLY_MAYBE_UNUSED folly::StringPiece _fname,
    FOLLY_MAYBE_UNUSED int16_t& fid,
    FOLLY_MAYBE_UNUSED apache::thrift::protocol::TType& _ftype) {
  if (false) {}
  else if (_fname == "dataTypes") {
    fid = 1;
    _ftype = apache::thrift::protocol::T_MAP;
  }
  else if (_fname == "names") {
    fid = 2;
    _ftype = apache::thrift::protocol::T_MAP;
  }
}

} // namespace detail
} // namespace thrift
} // namespace apache

namespace apache { namespace thrift { namespace reflection {

StructField::StructField() :
      isRequired(0),
      type(0),
      order(0) {}


StructField::~StructField() {}

StructField::StructField(apache::thrift::FragileConstructor, bool isRequired__arg, int64_t type__arg, ::std::string name__arg, std::unordered_map<::std::string, ::std::string> annotations__arg, int16_t order__arg) :
    isRequired(std::move(isRequired__arg)),
    type(std::move(type__arg)),
    name(std::move(name__arg)),
    annotations(std::move(annotations__arg)),
    order(std::move(order__arg)) {
  __isset.isRequired = true;
  __isset.type = true;
  __isset.name = true;
  __isset.annotations = true;
  __isset.order = true;
}

void StructField::__clear() {
  // clear all fields
  isRequired = 0;
  type = 0;
  name = apache::thrift::StringTraits< std::string>::fromStringLiteral("");
  annotations.clear();
  order = 0;
  __isset = {};
}

bool StructField::operator==(const StructField& rhs) const {
  (void)rhs;
  auto& lhs = *this;
  (void)lhs;
  if (!(lhs.isRequired == rhs.isRequired)) {
    return false;
  }
  if (!(lhs.type == rhs.type)) {
    return false;
  }
  if (!(lhs.name == rhs.name)) {
    return false;
  }
  if (lhs.__isset.annotations != rhs.__isset.annotations) {
    return false;
  }
  if (lhs.__isset.annotations) {
    if (!(lhs.annotations == rhs.annotations)) {
      return false;
    }
  }
  if (!(lhs.order == rhs.order)) {
    return false;
  }
  return true;
}

const std::unordered_map<::std::string, ::std::string>* StructField::get_annotations() const& {
  return __isset.annotations ? std::addressof(annotations) : nullptr;
}

std::unordered_map<::std::string, ::std::string>* StructField::get_annotations() & {
  return __isset.annotations ? std::addressof(annotations) : nullptr;
}


void swap(StructField& a, StructField& b) {
  using ::std::swap;
  swap(a.isRequired, b.isRequired);
  swap(a.type, b.type);
  swap(a.name, b.name);
  swap(a.annotations, b.annotations);
  swap(a.order, b.order);
  swap(a.__isset, b.__isset);
}

template void StructField::readNoXfer<>(apache::thrift::BinaryProtocolReader*);
template uint32_t StructField::write<>(apache::thrift::BinaryProtocolWriter*) const;
template uint32_t StructField::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
template uint32_t StructField::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
template void StructField::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t StructField::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t StructField::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t StructField::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

}}} // apache::thrift::reflection
namespace apache { namespace thrift { namespace reflection {

DataType::DataType() :
      mapKeyType(0),
      valueType(0) {}


DataType::~DataType() {}

DataType::DataType(apache::thrift::FragileConstructor, ::std::string name__arg, std::unordered_map<int16_t,  ::apache::thrift::reflection::StructField> fields__arg, int64_t mapKeyType__arg, int64_t valueType__arg, std::unordered_map<::std::string, int32_t> enumValues__arg) :
    name(std::move(name__arg)),
    fields(std::move(fields__arg)),
    mapKeyType(std::move(mapKeyType__arg)),
    valueType(std::move(valueType__arg)),
    enumValues(std::move(enumValues__arg)) {
  __isset.name = true;
  __isset.fields = true;
  __isset.mapKeyType = true;
  __isset.valueType = true;
  __isset.enumValues = true;
}

void DataType::__clear() {
  // clear all fields
  name = apache::thrift::StringTraits< std::string>::fromStringLiteral("");
  fields.clear();
  mapKeyType = 0;
  valueType = 0;
  enumValues.clear();
  __isset = {};
}

bool DataType::operator==(const DataType& rhs) const {
  (void)rhs;
  auto& lhs = *this;
  (void)lhs;
  if (!(lhs.name == rhs.name)) {
    return false;
  }
  if (lhs.__isset.fields != rhs.__isset.fields) {
    return false;
  }
  if (lhs.__isset.fields) {
    if (!(lhs.fields == rhs.fields)) {
      return false;
    }
  }
  if (lhs.__isset.mapKeyType != rhs.__isset.mapKeyType) {
    return false;
  }
  if (lhs.__isset.mapKeyType) {
    if (!(lhs.mapKeyType == rhs.mapKeyType)) {
      return false;
    }
  }
  if (lhs.__isset.valueType != rhs.__isset.valueType) {
    return false;
  }
  if (lhs.__isset.valueType) {
    if (!(lhs.valueType == rhs.valueType)) {
      return false;
    }
  }
  if (lhs.__isset.enumValues != rhs.__isset.enumValues) {
    return false;
  }
  if (lhs.__isset.enumValues) {
    if (!(lhs.enumValues == rhs.enumValues)) {
      return false;
    }
  }
  return true;
}

const std::unordered_map<int16_t,  ::apache::thrift::reflection::StructField>* DataType::get_fields() const& {
  return __isset.fields ? std::addressof(fields) : nullptr;
}

std::unordered_map<int16_t,  ::apache::thrift::reflection::StructField>* DataType::get_fields() & {
  return __isset.fields ? std::addressof(fields) : nullptr;
}

const std::unordered_map<::std::string, int32_t>* DataType::get_enumValues() const& {
  return __isset.enumValues ? std::addressof(enumValues) : nullptr;
}

std::unordered_map<::std::string, int32_t>* DataType::get_enumValues() & {
  return __isset.enumValues ? std::addressof(enumValues) : nullptr;
}


void swap(DataType& a, DataType& b) {
  using ::std::swap;
  swap(a.name, b.name);
  swap(a.fields, b.fields);
  swap(a.mapKeyType, b.mapKeyType);
  swap(a.valueType, b.valueType);
  swap(a.enumValues, b.enumValues);
  swap(a.__isset, b.__isset);
}

template void DataType::readNoXfer<>(apache::thrift::BinaryProtocolReader*);
template uint32_t DataType::write<>(apache::thrift::BinaryProtocolWriter*) const;
template uint32_t DataType::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
template uint32_t DataType::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
template void DataType::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t DataType::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t DataType::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t DataType::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

}}} // apache::thrift::reflection
namespace apache { namespace thrift { namespace reflection {

Schema::Schema(apache::thrift::FragileConstructor, std::unordered_map<int64_t,  ::apache::thrift::reflection::DataType> dataTypes__arg, std::unordered_map<::std::string, int64_t> names__arg) :
    dataTypes(std::move(dataTypes__arg)),
    names(std::move(names__arg)) {
  __isset.dataTypes = true;
  __isset.names = true;
}

void Schema::__clear() {
  // clear all fields
  dataTypes.clear();
  names.clear();
  __isset = {};
}

bool Schema::operator==(const Schema& rhs) const {
  (void)rhs;
  auto& lhs = *this;
  (void)lhs;
  if (!(lhs.dataTypes == rhs.dataTypes)) {
    return false;
  }
  if (!(lhs.names == rhs.names)) {
    return false;
  }
  return true;
}

const std::unordered_map<int64_t,  ::apache::thrift::reflection::DataType>& Schema::get_dataTypes() const& {
  return dataTypes;
}

std::unordered_map<int64_t,  ::apache::thrift::reflection::DataType> Schema::get_dataTypes() && {
  return std::move(dataTypes);
}

const std::unordered_map<::std::string, int64_t>& Schema::get_names() const& {
  return names;
}

std::unordered_map<::std::string, int64_t> Schema::get_names() && {
  return std::move(names);
}


void swap(Schema& a, Schema& b) {
  using ::std::swap;
  swap(a.dataTypes, b.dataTypes);
  swap(a.names, b.names);
  swap(a.__isset, b.__isset);
}

template void Schema::readNoXfer<>(apache::thrift::BinaryProtocolReader*);
template uint32_t Schema::write<>(apache::thrift::BinaryProtocolWriter*) const;
template uint32_t Schema::serializedSize<>(apache::thrift::BinaryProtocolWriter const*) const;
template uint32_t Schema::serializedSizeZC<>(apache::thrift::BinaryProtocolWriter const*) const;
template void Schema::readNoXfer<>(apache::thrift::CompactProtocolReader*);
template uint32_t Schema::write<>(apache::thrift::CompactProtocolWriter*) const;
template uint32_t Schema::serializedSize<>(apache::thrift::CompactProtocolWriter const*) const;
template uint32_t Schema::serializedSizeZC<>(apache::thrift::CompactProtocolWriter const*) const;

}}} // apache::thrift::reflection
