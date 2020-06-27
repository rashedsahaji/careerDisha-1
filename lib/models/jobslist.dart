// To parse this JSON data, do
//
//     final jobsList = jobsListFromJson(jsonString);

import 'dart:convert';

List<JobsList> jobsListFromJson(String str) =>
    List<JobsList>.from(json.decode(str).map((x) => JobsList.fromJson(x)));

String jobsListToJson(List<JobsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// List<Filters> filterFromJson(String str) =>
//     List<Filters>.from(json.decode(str).map((x) => Filters.fromJson(x)));

// String filterToJson(List<JobsList> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class JobsList {
  String company;
  String education;
  String experience;
  String industry;
  String jobdescription;
  int jobid;
  String joblocationAddress;
  String jobtitle;
  dynamic numberofpositions;
  String payrate;
  String postdate;
  String siteName;
  String skills;
  String uniqId;

  JobsList({
    this.company,
    this.education,
    this.experience,
    this.industry,
    this.jobdescription,
    this.jobid,
    this.joblocationAddress,
    this.jobtitle,
    this.numberofpositions,
    this.payrate,
    this.postdate,
    this.siteName,
    this.skills,
    this.uniqId,
  });

  factory JobsList.fromJson(Map<String, dynamic> json) =>
      JobsList(
        company: json["company"],
        education: json["education"],
        experience: json["experience"],
        industry: json["industry"],
        jobdescription: json["jobdescription"],
        jobid: json["jobid"],
        joblocationAddress: json["joblocation_address"],
        jobtitle: json["jobtitle"],
        numberofpositions: json["numberofpositions"],
        payrate: json["payrate"],
        postdate: json["postdate"],
        siteName: json["site_name"],
        skills: json["skills"],
        uniqId: json["uniq_id"],
      );

  Map<String, dynamic> toJson() =>
      {
        "company": company,
        "education": education,
        "experience": experience,
        "industry": industry,
        "jobdescription": jobdescription,
        "jobid": jobid,
        "joblocation_address": joblocationAddress,
        "jobtitle": jobtitle,
        "numberofpositions": numberofpositions,
        "payrate": payrate,
        "postdate": postdate,
        "site_name": siteName,
        "skills": skills,
        "uniq_id": uniqId,
      };
}

// class Filters {
//   String company;
//   String education;
//   String experience;
//   String industry;
//   String jobdescription;
//   int jobid;
//   String joblocationAddress;
//   String jobtitle;
//   dynamic numberofpositions;
//   String payrate;
//   String postdate;
//   String siteName;
//   String skills;
//   String uniqId;

//   Filters({
//     this.company,
//     this.education,
//     this.experience,
//     this.industry,
//     this.jobdescription,
//     this.jobid,
//     this.joblocationAddress,
//     this.jobtitle,
//     this.numberofpositions,
//     this.payrate,
//     this.postdate,
//     this.siteName,
//     this.skills,
//     this.uniqId,
//   });

//   factory Filters.fromJson(Map<String, dynamic> json) =>
//       Filters(
//         company: json["company"],
//         education: json["education"],
//         experience: json["experience"],
//         industry: json["industry"],
//         jobdescription: json["jobdescription"],
//         jobid: json["jobid"],
//         joblocationAddress: json["joblocation_address"],
//         jobtitle: json["jobtitle"],
//         numberofpositions: json["numberofpositions"],
//         payrate: json["payrate"],
//         postdate: json["postdate"],
//         siteName: json["site_name"],
//         skills: json["skills"],
//         uniqId: json["uniq_id"],
//       );

//   Map<String, dynamic> toJson() =>
//       {
//         "company": company,
//         "education": education,
//         "experience": experience,
//         "industry": industry,
//         "jobdescription": jobdescription,
//         "jobid": jobid,
//         "joblocation_address": joblocationAddress,
//         "jobtitle": jobtitle,
//         "numberofpositions": numberofpositions,
//         "payrate": payrate,
//         "postdate": postdate,
//         "site_name": siteName,
//         "skills": skills,
//         "uniq_id": uniqId,
//       };
// }