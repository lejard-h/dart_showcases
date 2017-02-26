// GENERATED CODE - DO NOT MODIFY BY HAND

part of shared.models.todo;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class TodoSerializer
// **************************************************************************

abstract class _$TodoSerializer implements Serializer<Todo> {
  Map toMap(Todo model, {bool withTypeInfo: false, String typeInfoKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["_id"] = model.id;
      }
      if (model.title != null) {
        ret["title"] = model.title;
      }
      if (model.content != null) {
        ret["content"] = model.content;
      }
      if (model.status != null) {
        ret["status"] = model.status;
      }
      if (modelString != null && withTypeInfo) {
        ret[typeInfoKey ?? defaultTypeInfoKey] = modelString;
      }
    }
    return ret;
  }

  Todo fromMap(Map map, {Todo model, String typeInfoKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Todo) {
      model = createModel();
    }
    model.id = map["_id"];
    model.title = map["title"];
    model.content = map["content"];
    model.status = map["status"];
    return model;
  }

  String get modelString => "Todo";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class MongoTodoSerializer
// **************************************************************************

abstract class _$MongoTodoSerializer implements Serializer<Todo> {
  Map toMap(Todo model, {bool withTypeInfo: false, String typeInfoKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["_id"] = new MongoId(#id).to(model.id);
      }
      if (model.title != null) {
        ret["title"] = model.title;
      }
      if (model.content != null) {
        ret["content"] = model.content;
      }
      if (model.status != null) {
        ret["status"] = model.status;
      }
      if (modelString != null && withTypeInfo) {
        ret[typeInfoKey ?? defaultTypeInfoKey] = modelString;
      }
    }
    return ret;
  }

  Todo fromMap(Map map, {Todo model, String typeInfoKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Todo) {
      model = createModel();
    }
    model.id = new MongoId(#id).from(map["_id"]);
    model.title = map["title"];
    model.content = map["content"];
    model.status = map["status"];
    return model;
  }

  String get modelString => "Todo";
}
