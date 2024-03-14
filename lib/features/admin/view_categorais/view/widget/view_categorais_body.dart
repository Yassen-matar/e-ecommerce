
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewCategoraisBody extends StatelessWidget {
  const ViewCategoraisBody({
    super.key,
    required this.data,
  });

  final List? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    EdgeInsets.only(right: 15.0.w, left: 15.w, top: 8.h),
                child: Card(
                    child: SizedBox(
                  height: 60.h,
                  child: Center(
                    child: Text(
                      '${data![index]['name']}',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                )),
              );
            },
          ),
        ),
      ],
    );
  }
}
