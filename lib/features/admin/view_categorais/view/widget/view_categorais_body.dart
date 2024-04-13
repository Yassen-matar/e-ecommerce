import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/constant/svg.dart';

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
                  padding: EdgeInsets.only(right: 15.0.w, left: 15.w, top: 8.h),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            '${data![index]['name']}',
                            style: const TextStyle(
                                fontSize: 30, fontFamily: 'MPLUSRounded1c'),
                          ),
                        ),
                        data?[index]['url'] != ''
                            ? CachedNetworkImage(
                                imageUrl: data?[index]['url'],
                                placeholder: (context, url) =>
                                    Center(child: Lottie.asset(AppSvg.loding)),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : Container(
                                height: 0,
                              )
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}

/*Image.network(
                  widget.networkUrl,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ), */