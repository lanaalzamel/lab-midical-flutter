import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  ResultsView({Key? key}) : super(key: key);
  ResultsController controller = Get.put(ResultsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    SizedBox(width: 25.w),
                    Text('Medical Lab Test Results',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lab Name',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text('Name : ',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('Mohammad', style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text('Age : ',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('44', style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text('Gender : ',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('female', style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        children: [
                          Text('Test category : ',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('category1', style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text('Test type : ',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('category1', style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: DataTable(
                          columnSpacing: 12,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Test Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Result',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Range',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: const <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Vit D')),
                                DataCell(Text('35')),
                                DataCell(Text('20-40')),
                                DataCell(Text('High')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Janine')),
                                DataCell(Text('43')),
                                DataCell(Text('Professor')),
                                DataCell(Text('Student')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('William')),
                                DataCell(Text('27')),
                                DataCell(Text('Associate Professor')),
                                DataCell(Text('Student')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(98).w,
                        child: SizedBox(
                          height: 40.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                          side: const BorderSide(
                                              color: Colors.black)))),
                              onPressed: () {},
                              child: Text("Convert to PDF".toUpperCase(),
                                  style: TextStyle(fontSize: 12.sp, letterSpacing: 2))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ListView.builder(
//   itemCount: controller.testDataList.length,
//   itemBuilder: (context, index) {
//     final testData = controller.testDataList[index];
//     return Card(
//       margin: EdgeInsets.symmetric(
//           horizontal: 16, vertical: 8),
//       child: ListTile(
//         title: Text(testData.testName),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Results: ${testData.results}'),
//             Text('Range: ${testData.range}'),
//             Text('Status: ${testData.status}'),
//           ],
//         ),
//       ),
//     );
//   },
// )
