import 'package:flutter/material.dart';
import '../models/post.dart';

class BlogDetailScreen extends StatelessWidget {
  final Post post;

  const BlogDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Big image header
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    post.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                  ),

                  // Top bar: back + bookmark
                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Title & meta info
                  Positioned(
                    left: 16,
                    bottom: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage("assets/images/avatar.png"), // replace with API
                            ),
                            const SizedBox(width: 6),
                            Text(post.author,
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(width: 12),
                            const Icon(Icons.access_time,
                                color: Colors.white, size: 16),
                            const SizedBox(width: 4),
                            Text(post.time,
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                post.body,
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
          ),
        ],
      ),

      // Floating like button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.favorite, color: Colors.red),
        label: const Text("285"),
        backgroundColor: Colors.white,
      ),
    );
  }
}
