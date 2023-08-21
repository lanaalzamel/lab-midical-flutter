import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/report_model.dart';
import '../controllers/medical_report_controller.dart';

class MedicalReportView extends GetView<MedicalReportController> {
  const MedicalReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10).w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: Image.asset('assets/images/biomarker.png',
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Biomarkers in cancer-associated thrombosis : insights from Prof Anna Falanga and Cinzia Giaccherini.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Text(
                  'In a webinar that was held World Thrombosis Day 2022, two coagulation experts—Prof Anna Falanga, Professor of Hematology at University of Milan Bicocca, and Cinzia Giaccherini, a research biologist with more than 10 years of experience in hemostasis and thrombosis—discussed the predictive role of biomarkers in cancer-associated thrombosis (CAT).Prof Anna Falanga began by presenting an overview of CAT risk prediction and prevention. UK and Danish cohort studies demonstrated that patients with cancer have a 4–11-fold increased risk for venous thromboembolism (VTE) as compared with non-cancer patients, depending on cancer type; with VTE affecting morbidity and mortality in cancer patients. In order to prevent VTE, high-risk cancer patients who may benefit from primary thromboprophylaxis need to be identified. Risk assessment modules (RAMs) such as the Khorana score can predict VTE risk in patients. RAMs can be augmented with biomarkers to improve prediction.Cinzia Giaccherini then discussed biomarkers for CAT prediction and disease prognosis in lung cancer. Coagulation biomarkers such as D-dimer were noted as potentially useful in evaluating a patient’s individual thrombotic risk. There is evidence for supporting their use in lung cancer patients, in which they could also be indicative of poor prognosis.Cinzia Giaccherini then discussed biomarkers for CAT prediction and disease prognosis in lung cancer. Coagulation biomarkers such as D-dimer were noted as potentially useful in evaluating a patient’s individual thrombotic risk. There is evidence for supporting their use in lung cancer patients, in which they could also be indicative of poor prognosis. Cinzia Giaccherini then discussed biomarkers for CAT prediction and disease prognosis in lung cancer. Coagulation biomarkers such as D-dimer were noted as potentially useful in evaluating a patient’s individual thrombotic risk. There is evidence for supporting their use in lung cancer patients, in which they could also be indicative of poor prognosis. Cinzia Giaccherini then discussed biomarkers for CAT prediction and disease prognosis in lung cancer. Coagulation biomarkers such as D-dimer were noted as potentially useful in evaluating a patient’s individual thrombotic risk. There is evidence for supporting their use in lung cancer patients, in which they could also be indicative of poor prognosis. Cinzia Giaccherini then discussed biomarkers for CAT prediction and disease prognosis in lung cancer. Coagulation biomarkers such as D-dimer were noted as potentially useful in evaluating a patient’s individual thrombotic risk. There is evidence for supporting their use in lung cancer patients, in which they could also be indicative of poor prognosis.',
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(height: 20.h,)
              ],
            ),
          ),
        ));
  }
}
