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
            "eyJraWQiOiJYcEhKU0EiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxOjczMDk1OTUyOTQ1NTp3ZWI6NjM3ZGEyZTgyNmU1ZGYzMjY0YTIxYSIsImF1ZCI6WyJwcm9qZWN0c1wvNzMwOTU5NTI5NDU1IiwicHJvamVjdHNcL21ha2FsYW0iXSwicHJvdmlkZXIiOiJyZWNhcHRjaGFfZW50ZXJwcmlzZSIsImlzcyI6Imh0dHBzOlwvXC9maXJlYmFzZWFwcGNoZWNrLmdvb2dsZWFwaXMuY29tXC83MzA5NTk1Mjk0NTUiLCJleHAiOjE3MTMzODkzNzgsImlhdCI6MTcxMzM4NTc3OCwianRpIjoiX2FoUHVCX081ZkpjaDR4VDYwRnYyRXBKbUs4RGZzWnczRWZZQWI3RHQxdyJ9.Sh3gnj_Jxh0xoSXx0D3Cc6sGmKRHy7KmYnACRvhzOxKlq4hH5xMg-l4tRoQkralHAV8MeTA1XVDZbeuTrsfaEgvAPL_SUIt5Du0HAdHpps3Wy3A4Uk3vbPfXY-w8kICS4tUTZiinyzJhUhgARET-dWSg78YUlX07o75FoX0VwwTQ-L_eSTMnaFYEDGdWFKTlaFVIC78vDTRmMnws6j6gdoYi3ds-MhmLdj14RAttbUASqdmURm9vr7cGwMZ_CRgEs71f77BVp27rU-wCVri9R-4EIMLbQ2q2t5WrOcyxWqHGnrx82wFh363y-Y_YF18eYRepJJBWP3jMG43KSjM0fMeZD0nqKywyGMWv2jxWPnIaYRKaEksL2h7jFQ5SSl03QpdSxSMi6ldMrWN4Z_LBJ4lz9spS3HwmGCv-P-pQYV4hilkXpfu4Q7sVgoRyUyWTxYR9TUrR9_rwgoKX-uOE_WuAuj_T3FrownaT7ZEfJ4wSKUmuN8SKF0bmsqtY5X5z",
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
