import 'dart:convert';

import 'package:careerdisha/models/jobslist.dart';

import 'package:http/http.dart' as http;

class JsonServices {
  static const String url =
      'https://firebasestorage.googleapis.com/v0/b/career-disha-ba833.appspot.com/o/jobs.json?alt=media&token=f54925d2-5d40-47ce-ac94-edceb68acfc3';

  static Future<List<JobsList>> getJobList() async {
    try {
      // var item;
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<JobsList> joblist = jobsListFromJson(response.body);
        // List<JobsList> filter;
        // for (var item in joblist) {
          // print("hello");
          // joblist.where((element) 
          // {
            // print("rcfrgfvty");
            // element.joblocationAddress='Chennai';
            // return null;});
          // joblist.map((e){
          //   print("ki");
          //   print(e.jobtitle);
          //   e.joblocationAddress='';
          //   e.jobtitle='';
          //   // if(e.joblocationAddress=="Chennai")
          //   // {
          //   //   print(e.joblocationAddress);
          //   // } 
          //   });

        // }
        
        return joblist;    
      } else {
        return List<JobsList>();
      }
    } catch (e) {
      return List<JobsList>();
    }
  }

  static List<JobsList> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<JobsList>((json) => JobsList.fromJson(json)).toList();
  }
}
