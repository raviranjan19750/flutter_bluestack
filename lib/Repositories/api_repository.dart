import 'dart:convert';
import 'dart:io';

import 'package:bluestack_assignment/Config/ApiStatusKey.dart';
import 'package:bluestack_assignment/DataModels/RecommendationsDetail.dart';
import 'package:bluestack_assignment/DataModels/UserDetail.dart';
import 'package:http/http.dart' as http;

class ApiRepository{

  static const String userApi = "https://userdetailapi.herokuapp.com/api/";
  static const String api = "https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/";


  // fetching user-detail data
  Future<UserDetail>  getUserDetailApiResponse() async {


    var response =  await http.get(Uri.parse(userApi + "user_detail"),  headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    if(response.statusCode == ApiResponseCode.SUCCESS) {

      var map = jsonDecode(response.body);
      UserDetail userDetail = UserDetail.fromApiResponse(map);

      return userDetail;

    }else{

      throw Exception(response.statusCode);
    }




  }



  Future<RecommendationsDetail> getRecommendationDetails(int itemCount) async {

    var response = await http.get(Uri.parse(api + "tournaments_list_v2?limit=$itemCount&status=all"),  headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    if(response.statusCode == ApiResponseCode.SUCCESS){

      RecommendationsDetail recommendationsDetail = RecommendationsDetail.fromJson(jsonDecode(response.body));

      return recommendationsDetail;

    }
    else{

      throw Exception(response.statusCode);

    }

  }


  Future<RecommendationsDetail> getNextRecommendationDetails(int itemCount, String cursor) async {

    print("Cursor  :  " + cursor);

    var response = await http.get(Uri.parse(api + "tournaments_list_v2?limit=$itemCount&status=all&cursor=$cursor"),  headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    if(response.statusCode == ApiResponseCode.SUCCESS){

      RecommendationsDetail recommendationsDetail = RecommendationsDetail.fromJson(jsonDecode(response.body));

      return recommendationsDetail;

    }
    else{

      throw Exception(response.statusCode);

    }

  }



}