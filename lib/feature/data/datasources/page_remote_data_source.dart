import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:makalam_homework/core/error/exception.dart';
import 'package:makalam_homework/feature/data/models/page_model.dart';

abstract class PageRemoteDataSource {
  /// Calls the https://makalam.com/api/articles/ endpoint
  ///
  ///Throws a [ServerException] for all error codes.
  Future<PageModel> getAllArticles(int page);
}

class PageRemoteDataSourceImpl implements PageRemoteDataSource {
  final Client client;

  PageRemoteDataSourceImpl({required this.client});

  @override
  Future<PageModel> getAllArticles(int page) async {
    final response = await client.get(
      Uri.parse("https://makalam.com/api/articles/?page=$page"),
      headers: {
        'X-Firebase-Appcheck':
            "eyJraWQiOiJYcEhKU0EiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxOjczMDk1OTUyOTQ1NTp3ZWI6NjM3ZGEyZTgyNmU1ZGYzMjY0YTIxYSIsImF1ZCI6WyJwcm9qZWN0c1wvNzMwOTU5NTI5NDU1IiwicHJvamVjdHNcL21ha2FsYW0iXSwicHJvdmlkZXIiOiJyZWNhcHRjaGFfZW50ZXJwcmlzZSIsImlzcyI6Imh0dHBzOlwvXC9maXJlYmFzZWFwcGNoZWNrLmdvb2dsZWFwaXMuY29tXC83MzA5NTk1Mjk0NTUiLCJleHAiOjE3MTM3MjEzNjUsImlhdCI6MTcxMzcxNzc2NSwianRpIjoiQmVfVjV0MHg5UTJLWjV5QWpLX3hDUWVFLTZYNFNCN2dTS2xoX3Y5QmJaVSJ9.PxbmqojUSozovsCmJuF83T0B1OkqgKn7FHOKK-YiwQlwaFYF_kLzVXIxpDUuwQzboS0b8AUjeMNcctSu8NFxJHQmUs7o5LGBlzJdNr-rTedaXjbCrbJIxUNjYB02Yn_jGXG0EYW8Wlm86U110H2hEcm_N1_0bvRWoXdVGc6qHbk84YTQ17CKjDHJrLL45gwkOkGlTzVLPm7INtd4liHxwT14wWBLA0LHQb_HKSsa4654n4x7N1_L2FDMBzomrfINQEyKZZf-qRNHn_h6xec9Dtx3FXi4p1HxZW47cCfswTJtOnE6o55FDKlooqJH2dSJZjuBB-l87GiWr00KpsoGVkstXN__JGC1h-FLApZ-msaumYM6zFJ_6dYEIyncdV_LaAleT3VJtC2lqIocpvLj_QmMOYeVMisEbU9FtVg7et5pSNElISvzrR3D35yCcPOri8B52wfmPEmTS54GbEwNfjq9Mxq3ECwYEqibttyKsLQ-sLmTAuVo8wpfnxqTfLk6",
      },
    );

    log("${response.statusCode}: ${response.contentLength}");
    if (response.statusCode == 200) {
      final page = jsonDecode(response.body);
      return PageModel.fromJson(page);
    } else {
      throw ServerException();
    }
  }
}
