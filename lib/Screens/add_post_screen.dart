import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/Models/user.dart';
import 'package:insta_clone/Provider/user_provider.dart';
import 'package:insta_clone/Resource/FireStore_methods.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:provider/provider.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   Uint8List? _file;
//   final TextEditingController _discriptionController = TextEditingController();
//   bool _isLoading = false;
//   _selectImage(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return SimpleDialog(
//             title: const Text("Create a post"),
//             children: [
//               SimpleDialogOption(
//                 padding: EdgeInsets.all(20),
//                 child: Text("Take a photo"),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   Uint8List file = await pickImage(ImageSource.camera);
//                   setState(() {
//                     _file = file;
//                   });
//                 },
//               ),
//               SimpleDialogOption(
//                 padding: EdgeInsets.all(20),
//                 child: Text("Choose from gallery"),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   Uint8List file = await pickImage(ImageSource.gallery);
//                   setState(() {
//                     _file = file;
//                   });
//                 },
//               ),
//               SimpleDialogOption(
//                 padding: EdgeInsets.all(20),
//                 child: Text("Cancel"),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   void postImage(
//     String uid,
//     String profileImage,
//     String username,
//   ) async {
//     try {
//       setState(() {
//         _isLoading = true;
//       });
//       String res = await firestoreMethods().uploadPost(
//         _discriptionController.text,
//         _file!,
//         uid,
//         username,
//         profileImage,
//       );
//       setState(() {
//         _isLoading = false;
//       });
//       if (res == 'success') {
//         showSnackBar(
//           "Uploaded!",
//           context,
//         );
//         clearImage();
//       } else {
//         showSnackBar(
//           res,
//           context,
//         );
//       }
//     } catch (error) {
//       showSnackBar(
//         error.toString(),
//         context,
//       );
//     }
//   }

//   void clearImage() {
//     setState(() {
//       _file = null;
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _discriptionController.dispose();
//   }
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   setData();
//   // }

//   // setData() async {
//   //   UserProvider _userProvider = Provider.of(context, listen: false);
//   //   await _userProvider.refreshUser();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     UserModel? user = Provider.of<UserProvider>(context).getUser;

//     // UserModel? user = UserProvider().getUser;

//     return _file == null
//         ? Center(
//             child: IconButton(
//               onPressed: () => _selectImage(context),
//               icon: Icon(
//                 Icons.upload,
//               ),
//             ),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               backgroundColor: mobileBackgroundColor,
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {},
//               ),
//               title: const Text("Post to"),
//               centerTitle: false,
//               actions: [
//                 TextButton(
//                   onPressed: () => postImage(
//                     user.uid!,
//                     user.username!,
//                     user.photoUrl!,
//                   ),
//                   child: Text(
//                     "Post",
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             body: _isLoading
//                 ? LinearProgressIndicator()
//                 : Column(children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(user.photoUrl!),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.3,
//                           child: TextField(
//                             controller: _discriptionController,
//                             decoration: InputDecoration(
//                               hintText: "Write a caption",
//                               border: InputBorder.none,
//                             ),
//                             maxLines: 8,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 45,
//                           width: 45,
//                           child: AspectRatio(
//                             aspectRatio: 487 / 451,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: MemoryImage(_file!),
//                                   fit: BoxFit.fill,
//                                   alignment: FractionalOffset.topCenter,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Divider(),
//                       ],
//                     )
//                   ]),
//           );
//   }
// }

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await firestoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          'Posted!',
          context,
        );
        clearImage();
      } else {
        showSnackBar(res, context);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(
                Icons.upload,
              ),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              title: const Text(
                'Post to',
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  onPressed: () => postImage(
                    userProvider.getUser.uid!,
                    userProvider.getUser.username!,
                    userProvider.getUser.photoUrl!,
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        userProvider.getUser.photoUrl!,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: "Write a caption...",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
