
// import 'package:communityapp/community/models/post.dart';
// import 'package:communityapp/community/models/user.dart';
// import 'package:communityapp/community/services/posts.dart';
// import 'package:communityapp/community/services/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// import '../posts/list.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//    State<StatefulWidget> createState() {
//     return _ProfileState();
//   }
// }

// // class _ProfileState extends State<Profile> {
// //   final PostService _postService = PostService();
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamProvider.value(
// //         value:
// //             final Object? uid = ModalRoute.of(context)?.settings.arguments;
// //         initialData: null,
// //         child: const Scaffold(
// //           body: ProfilePosts(),
// //         ));
// //   }
// // }


// class _ProfileState extends State<Profile> {
//   final PostService _postService = PostService();
//   final UserService _userService = UserService();
  
//   @override
//   Widget build(BuildContext context) {
//     final Object? uid = ModalRoute.of(context)!.settings.arguments;
  
//     return MultiProvider(
//         providers: [
//           StreamProvider.value(
//             value: _postService
//                 .getPostsByUser(uid), initialData: null,
//           ),
//           StreamProvider.value(
//             value:
//                 _userService.getUserInfo(uid), initialData: null,
//           )
//         ],
//         child: Scaffold(
//             body: DefaultTabController(
//           length: 2,
//           child: NestedScrollView(
//               headerSliverBuilder: (context, _) {
//                 return [
//                   SliverAppBar(
//                     floating: false,
//                     pinned: true,
//                     expandedHeight: 130,
//                     flexibleSpace: FlexibleSpaceBar(
//                       background: Image.network(    
//                       Provider.of<UserModel? >(context)?.bannerImageUrl ?? '',
//                       fit: BoxFit.cover,
//                       loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         }
//                         return Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                     loadingProgress.expectedTotalBytes!
//                                 : null,
//                           ),
//                         );
//                       },
//                     )),
//                   ),
//                   SliverList(
//                       delegate: SliverChildListDelegate([
//                     Container(
//                       padding:
//                           const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                       child: Column(
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.network(
//                                   Provider.of<UserModel?>(context)?.profileImageUrl ?? '',
//                                   height: 60,
//                                   fit: BoxFit.cover,
                          
//                                 ),
                                
//                                 ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.pushNamed(context, '/edit');
//                                     },
//                                     child: const Text("Edit Profile"))
//                               ]),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Text(
//                                 Provider.of<UserModel?>(context)?.name ?? '',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ]))
//                 ];
//               },
//               body: const ProfilePosts()),
//         )));
//   }
// }


import 'package:communityapp/community/models/post.dart';
import 'package:communityapp/community/models/user.dart';
import 'package:communityapp/community/screens/posts/list.dart';
import 'package:communityapp/community/services/posts.dart';
import 'package:communityapp/community/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final PostService _postService = PostService();
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    final Object? uid = ModalRoute.of(context)?.settings.arguments;
    return MultiProvider(
        providers: [
          StreamProvider.value(
            value: _userService.isFollowing(
                FirebaseAuth.instance.currentUser?.uid, uid), initialData: true,
          ),
          StreamProvider.value(
            value: _postService.getPostsByUser(uid), initialData: null,
          ),
          StreamProvider.value(
            value: _userService.getUserInfo(uid), initialData: null,
          )
        ],
        child: Scaffold(
            body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, _) {
                return [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    backgroundColor: const Color(0xff004B20),
                    expandedHeight: 130,
                    flexibleSpace: FlexibleSpaceBar(
                        background:Image.network(
                         Provider.of<UserModel?>(context)?.bannerImageUrl ?? '',
                          
                      fit: BoxFit.cover,
                    )),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Provider.of<UserModel?>(context)?.profileImageUrl !='' ? CircleAvatar(
                                        radius: 30,
                      
                                        backgroundImage: NetworkImage(
                                        
                                            Provider.of<UserModel?>(context)?.profileImageUrl ?? 'loadingagain'),
                                      )
                                    : const Icon(Icons.person, size: 50),
                                  if (FirebaseAuth.instance.currentUser?.uid ==uid)
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/edit');
                                      },
                                      child: const Text("Edit Profile"))
                                  else if (FirebaseAuth.instance.currentUser?.uid !=uid && !Provider.of<bool>(context))
                                  TextButton(
                                      onPressed: () {
                                        _userService.followUser(uid);
                                      },
                                      child: const Text("Follow"))
                                else if (FirebaseAuth.instance.currentUser?.uid != uid && Provider.of<bool>(context))
                                  TextButton(
                                      onPressed: () {
                                        _userService.unfollowUser(uid);
                                      },
                                      child: const Text("Unfollow")),
                              ]),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Provider.of<UserModel?>(context)?.name ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
                ];
              },
              body: ListPosts(null)),
              // body:Container(),
        )));
  }
}


// class Profile extends StatefulWidget {
//   Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final PostService _postService = PostService();
//   final UserService _userService = UserService();

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           StreamProvider.value(
//             value: _postService
//                 .getPostsByUser(FirebaseAuth.instance.currentUser?.uid), initialData: null,
//           ),
//           StreamProvider.value(
//             value:
//                 _userService.getUserInfo(FirebaseAuth.instance.currentUser?.uid), initialData: null,
//           )
//         ],
//         child: Scaffold(
//             body: DefaultTabController(
//           length: 2,
//           child: NestedScrollView(
//               headerSliverBuilder: (context, _) {
//                 return [
//                   SliverAppBar(
//                     floating: false,
//                     pinned: true,
//                     expandedHeight: 130,
//                     flexibleSpace: FlexibleSpaceBar(
//                         background: Image.network(
//                       Provider.of<UserModel?>(context)?.bannerImageUrl ?? '',
//                       fit: BoxFit.cover,
//                     )),
//                   ),
//                   SliverList(
//                       delegate: SliverChildListDelegate([
//                     Container(
//                       padding:
//                           const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                       child: Column(
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.network(
//                                   Provider.of<UserModel?>(context)?.profileImageUrl ?? '',
//                                   height: 60,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 TextButton(
//                                     onPressed: () {
//                                       Navigator.pushNamed(context, '/edit');
//                                     },
//                                     child: Text("Edit Profile"))
//                               ]),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Container(
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               child: Text(
//                                 Provider.of<UserModel?>(context)?.name ?? '',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ]))
//                 ];
//               },
//               body:const ProfilePosts()),
//         )));
//   }
// }




class ProfilePosts extends StatefulWidget {
  const ProfilePosts({Key? key}) : super(key: key);

  @override
  _ProfilePostsState createState() => _ProfilePostsState();
}

class _ProfilePostsState extends State<ProfilePosts> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<PostModel>?>(context) ?? [];
    print(posts);

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.creator),
          subtitle: Text(post.text),
        );
      },
    );
  }
}