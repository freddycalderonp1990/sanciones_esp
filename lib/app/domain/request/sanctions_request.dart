part of 'my_request.dart';

class SanctionsRequest {



 final int code;
 final String missingDescription;
  final String dateSanction;
  final String dateRegistration;
 final int instructor;
  final int cadet;
  final int sectionPromotion;
  final int legalRegulation;
  final int score;
  final int statusSanction;

 SanctionsRequest({
   required this.code,
   required this.missingDescription,
   required this.dateSanction,
   required this.dateRegistration,
   required this.instructor,
   required this.cadet,
   required this.sectionPromotion,
   required this.legalRegulation,
   required this.score,
   required this.statusSanction,
 });

}
