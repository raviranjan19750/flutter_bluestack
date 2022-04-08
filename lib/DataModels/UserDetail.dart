class UserDetail {
  String userName = "" ;
  String profileUrl  = "";
  String eloRating  = "";
  String totalTournamentCount  = "";
  String tournamentWon = "";

  UserDetail(
      {this.userName,
        this.profileUrl,
        this.eloRating,
        this.totalTournamentCount,
        this.tournamentWon});

  factory UserDetail.fromApiResponse(Map<String,dynamic> data) {

    if (data == null) return null;

    return UserDetail(

      userName :  data["userName"] ,
      profileUrl :  data["profileUrl"] ,
      eloRating :  data["eloRating"] ,
      totalTournamentCount :  data["totalTournamentCount"] ,
      tournamentWon :  data["tournamentWon"] ,

    );
  }
}