import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/components.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/datacontroller.dart';
import 'package:portfolio/controller/pagecontroller.dart';
import 'package:portfolio/model/firemodel.dart';
import 'package:portfolio/service/firebaseService.dart';

class FormUpdate extends StatelessWidget {
  const FormUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;

    FirebasePortService service = FirebasePortService();
    final formKey = GlobalKey<FormState>();
    DataController dataController = Get.put(DataController());
    PageControllers pageController = Get.put(PageControllers());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Add Project".toUpperCase(),
          style: const TextStyle(
            color: primaryColor,
            letterSpacing: 3,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: SizedBox(
            width: dWidth(context),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 15,
              children: [
                textFormField("Title", context, Icons.title_rounded,
                    dataController.title),
                textFormField("Subtitle", context, Icons.subtitles,
                    dataController.stitle),
                textFormField("Github Link", context, FontAwesomeIcons.github,
                    dataController.github),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Obx(() => GestureDetector(
                        onTap: () async {
                          result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowMultiple: false,
                              allowedExtensions: ['jpg']);
                          if (!(result.isBlank!)) {
                            dataController.byteData.value =
                                "/projecImages/" + result!.files[0].name;

                            pageController.changeImage();
                          }
                        },
                        child: pageController.imageController.value
                            ? SizedBox(
                                height: dHeight(context) * 0.25,
                                width: dWidth(context) * 0.13,
                                child: Image.memory(
                                  result!.files[0].bytes!,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: darkColor,
                                    borderRadius: BorderRadius.circular(5)),
                                height: dHeight(context) * 0.25,
                                width: dWidth(context) * 0.13,
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                      )),
                ),
                TextFormField(
                  style: const TextStyle(color: primaryColor),
                  onSaved: (value) {
                    dataController.desc.value = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please give some Description";
                    }
                    return null;
                  },
                  maxLines: 8,
                  decoration: const InputDecoration(
                      hintText: "Description",
                      hintStyle: TextStyle(color: bodyTextColor)),
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            FireModel data =
                                dataController.convertTofiremodel();
                            if (result!.count > 0) {
                              showLoaderDialog(context, "Uploading");
                              service.uploadImage(data, result!, context);
                            } else {}
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: primaryColor,
                                  width: dsize(context) * 0.003)),
                          width: dWidth(context) * 0.2,
                          height: dHeight(context) * 0.06,
                          child: Center(
                              child: Text(
                            "Upload".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: dWidth(context) * 0.08,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          formKey.currentState!.reset();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: primaryColor,
                                  width: dsize(context) * 0.003)),
                          width: dWidth(context) * 0.2,
                          height: dHeight(context) * 0.06,
                          child: Center(
                              child: Text(
                            "Reset".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3),
                          )),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

showLoaderDialog(BuildContext context, String name) {
  AlertDialog alert = AlertDialog(
    backgroundColor: bgColor,
    content: SizedBox(
        height: dHeight(context) * 0.3,
        width: dWidth(context) * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: secondaryColor,
            ),
            SizedBox(
              height: dHeight(context) * 0.08,
            ),
            Text(
              name + "...",
              style: const TextStyle(color: primaryColor),
            ),
          ],
        )),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
