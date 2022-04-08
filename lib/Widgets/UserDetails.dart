import 'package:bluestack_assignment/Config/ColorPalettes.dart';
import 'package:bluestack_assignment/Config/KeyStrings.dart';
import 'package:bluestack_assignment/DataModels/UserDetail.dart';
import 'package:bluestack_assignment/localization/language_constants.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {

  UserDetail userDetail;

  UserDetails({ this.userDetail});

  double calculatePercentageWin(int totalTournamentPlayed, int totalTournamentWon) {

    double winPercent = (totalTournamentWon/totalTournamentPlayed)*100;
    double val =  double.parse((winPercent).toStringAsFixed(1));
    return val;


  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: double.maxFinite,

      child: Column(

        children: [

          Row(

            children: [

              Container(

                width: 80.0,

                height: 80.0,

                alignment: Alignment.center,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black54),
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:  NetworkImage(userDetail.profileUrl),
                    )
                ),

                child : Container() ,

              ),

              SizedBox(width: 16,),

              Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(

                    child: Text(userDetail.userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                  ),

                  SizedBox(height: 16.0,),

                  Container(

                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(48.0)),
                        border: Border.all(color: Colors.blue)



                    ),
                    child: Row(

                      children: [

                        Container(

                          child: Text(userDetail.eloRating.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),),
                        ),

                        SizedBox(width: 16,),

                        Container(

                          child: Text(getTranslated(context, KeyStrings.eloRating), style: TextStyle(color: Colors.grey),),
                        ),

                      ],
                    ),
                  ),


                ],
              ),

            ],
          ),

          SizedBox(height: 24,),

          Row(

            children: [

              Expanded(
                flex: 1,
                child: Container(

                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), bottomLeft: Radius.circular(16.0)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          ColorPalettes.mustard,
                          ColorPalettes.mustardLight,
                        ],
                      )
                  ),
                  child: Column(

                    children: [

                      Text(userDetail.totalTournamentCount.toString(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),

                      SizedBox(height: 4,),

                      Text(getTranslated(context, KeyStrings.tournamentsPlayed), textAlign:TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(

                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          ColorPalettes.darkBlue,
                          ColorPalettes.purple,
                        ],
                      )
                  ),

                  child: Column(

                    children: [

                      Text(userDetail.tournamentWon.toString(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),

                      SizedBox(height: 4,),

                      Text(getTranslated(context, KeyStrings.tournamentsWon), textAlign:TextAlign.center, style: TextStyle( fontSize:12, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(

                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          ColorPalettes.redLight,
                          ColorPalettes.orangeLight,
                        ],
                      )
                  ),
                  child: Column(

                    children: [

                      Text((calculatePercentageWin(int.parse(userDetail.totalTournamentCount), int.parse(userDetail.tournamentWon)).toString() + "%"), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),

                      SizedBox(height: 4,),

                      Text(getTranslated(context, KeyStrings.winningPercentage), textAlign:TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ],
          )

        ],
      ),


    );
  }
}
