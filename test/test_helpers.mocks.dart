// Mocks generated by Mockito 5.4.4 from annotations
// in wotd/test/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:wotd/model/words_of_day_response.dart' as _i2;
import 'package:wotd/repository/word_repository.dart' as _i4;
import 'package:wotd/service/api_service.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWordsOfDayListResponse_0 extends _i1.SmartFake
    implements _i2.WordsOfDayListResponse {
  _FakeWordsOfDayListResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRequestOptions_1 extends _i1.SmartFake
    implements _i3.RequestOptions {
  _FakeRequestOptions_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStackTrace_2 extends _i1.SmartFake implements StackTrace {
  _FakeStackTrace_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDioException_3 extends _i1.SmartFake implements _i3.DioException {
  _FakeDioException_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IWordRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIWordRepository extends _i1.Mock implements _i4.IWordRepository {
  MockIWordRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.WordsOfDayListResponse> getWordOfTheDay() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWordOfTheDay,
          [],
        ),
        returnValue: _i5.Future<_i2.WordsOfDayListResponse>.value(
            _FakeWordsOfDayListResponse_0(
          this,
          Invocation.method(
            #getWordOfTheDay,
            [],
          ),
        )),
      ) as _i5.Future<_i2.WordsOfDayListResponse>);
}

/// A class which mocks [IApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIApiService extends _i1.Mock implements _i6.IApiService {
  MockIApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<dynamic> get(
    String? endpoint, {
    Map<String, dynamic>? params,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [endpoint],
          {#params: params},
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
}

/// A class which mocks [DioException].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioException extends _i1.Mock implements _i3.DioException {
  MockDioException() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.RequestOptions get requestOptions => (super.noSuchMethod(
        Invocation.getter(#requestOptions),
        returnValue: _FakeRequestOptions_1(
          this,
          Invocation.getter(#requestOptions),
        ),
      ) as _i3.RequestOptions);

  @override
  _i3.DioExceptionType get type => (super.noSuchMethod(
        Invocation.getter(#type),
        returnValue: _i3.DioExceptionType.connectionTimeout,
      ) as _i3.DioExceptionType);

  @override
  StackTrace get stackTrace => (super.noSuchMethod(
        Invocation.getter(#stackTrace),
        returnValue: _FakeStackTrace_2(
          this,
          Invocation.getter(#stackTrace),
        ),
      ) as StackTrace);

  @override
  set stringBuilder(_i3.DioExceptionReadableStringBuilder? _stringBuilder) =>
      super.noSuchMethod(
        Invocation.setter(
          #stringBuilder,
          _stringBuilder,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.DioException copyWith({
    _i3.RequestOptions? requestOptions,
    _i3.Response<dynamic>? response,
    _i3.DioExceptionType? type,
    Object? error,
    StackTrace? stackTrace,
    String? message,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #copyWith,
          [],
          {
            #requestOptions: requestOptions,
            #response: response,
            #type: type,
            #error: error,
            #stackTrace: stackTrace,
            #message: message,
          },
        ),
        returnValue: _FakeDioException_3(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #requestOptions: requestOptions,
              #response: response,
              #type: type,
              #error: error,
              #stackTrace: stackTrace,
              #message: message,
            },
          ),
        ),
      ) as _i3.DioException);
}
