import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:instasave/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:instasave/UI/Commons/TextWidgets/Base/text_style.dart';

class recentCard extends StatelessWidget {
  const recentCard({
    super.key,
    required this.mediaLink,
    required this.profileImageLink,
    required this.userName,
    required this.caption,
    required this.onDownloadTap,
  });

  final String mediaLink;
  final String profileImageLink;
  final String userName;
  final String caption;
  final GestureTapCallback onDownloadTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDownloadTap,
      child: Container(
        height: displayHeight(context) * .300,
        width: displayWidth(context)*.576,
        margin:  EdgeInsets.only(right: displayWidth(context)*.0426),
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.borderColor),
          borderRadius: BorderRadius.circular(16),
          color: ColorConstants.caption,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.asset(
                ImageConstants.recentCardGlassmorphism,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Media
                  Container(
                    margin: EdgeInsets.all(12),
                    height: displayHeight(context) * .182,
                    width: displayWidth(context)*.512,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstants.caption,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: mediaLink,
                        errorWidget: (context, uri, error) {
                          return const Icon(
                            Icons.error,
                            color: ColorConstants.purple,
                          );
                        },
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const Center(
                            child: Icon(
                          Icons.signal_wifi_statusbar_connected_no_internet_4,
                          color: ColorConstants.purple,
                        )),
                      ),
                    ),
                  ),

                  ListTile(
                      contentPadding:   EdgeInsets.only(left:  displayWidth(context)*.032,right:  displayWidth(context)*.032),//displayHeight(context)*.0147
                    horizontalTitleGap: 2,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: displayHeight(context)*.0369,
                         width: displayWidth(context)*.08,
                         child: CachedNetworkImage(
                                 imageUrl: profileImageLink,
                                 errorWidget: (context, uri, error) {
                                   return const Icon(
                                     Icons.error,
                                     color: ColorConstants.purple,
                                   );
                                 },
                                 imageBuilder: (context, imageProvider) => Container(
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: imageProvider,
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                 ),
                                 placeholder: (context, url) => const Center(
                                     child: Icon(
                                   Icons
                                       .signal_wifi_statusbar_connected_no_internet_4,
                                   color: ColorConstants.purple,
                                 )),
                               ),
                       )
                    ),
                    title: Text(
                      userName,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStylePoppinsSemiBold14(color: ColorConstants.white),
                    ),
                    subtitle: Text(caption,
                        maxLines: 1,
                        style: TextStylePoppinsRegular12(color: Colors.white),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onDownloadTap??(){},
                child: Padding(
                  padding:  EdgeInsets.only(bottom: displayHeight(context) * .0886, right:  displayWidth(context)*.0853),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: displayHeight(context)*.0467,
                      width: displayWidth(context)*.1013,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorConstants.cardBackGroundColor,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        height: displayHeight(context)*.0394,
                        width: displayWidth(context)*.0853,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: ColorConstants.linearGradientDeleteButton)),
                        alignment: Alignment.center,
                        child:  Icon(Icons.download,
                            color: ColorConstants.white, size: displayHeight(context)*.02216),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
