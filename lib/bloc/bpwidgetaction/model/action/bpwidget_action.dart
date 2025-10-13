// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
  @author   :   karthick.d  13/10/2025
  @desc     :   configure action for formcontrol events which conprises of 
                actionid , and BPwidgetJob object

*/
import 'package:dashboard/bloc/bpwidgetaction/model/jobs/bpwidget_job.dart';

class BpwidgetAction {
  final String id;
  final String name;
  final BPwidgetJob job;
  BpwidgetAction({required this.name, required this.id, required this.job});
}
