// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }  static _getFromJson<T>(Type type, data, json) {
    switch (type) {    }
    return data as T;
  }  static _getToJson<T>(Type type, data) {
		switch (type) {    }
    return data as T;
  }  static T fromJsonAsT<T>(json) {
    switch (T.toString()) {    }
    return null;
  }}