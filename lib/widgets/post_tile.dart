import 'package:blog/screens/blogdetailscreen.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
// import '../screens/blogdetailscreen.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlogDetailScreen(post: post)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF23262B)
                  : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                post.imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white54
                                : Colors.grey[700],
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        post.author,
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white54
                                  : Colors.grey[700],
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.access_time,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white54
                                : Colors.grey[500],
                        size: 14,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        post.time,
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white38
                                  : Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
