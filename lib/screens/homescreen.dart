import 'package:flutter/material.dart';
import '../main.dart';
import '../services/api_service.dart';
import '../models/post.dart';
import '../widgets/post_tile.dart';
import '../widgets/featuredimage.dart';
import '../widgets/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = ApiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            themeNotifier.value == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () {
            themeNotifier.value =
                themeNotifier.value == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark;
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.secondary.withOpacity(0.2),
              child: const Icon(Icons.person, color: Colors.grey),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: \\${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No posts found"));
          } else {
            return ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
           
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back, Faith!",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 18,
                       
                        ),
                      ),
                      Text(
                        "Recomendacao",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              
                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    children: [
                      FeaturedImage(
                        url:
                            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                        title: 'The Beauty of Nature',
                        author: 'By John Doe',
                      ),
                      FeaturedImage(
                        url:
                            'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80',
                        title: 'Urban Exploration',
                        author: 'By Jane Smith',
                      ),
                      FeaturedImage(
                        url:
                            'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
                        title: 'Mountain Adventure',
                        author: 'By Alex Lee',
                      ),
                    ],
                  ),
                ),
                // Horizontal categories
                SizedBox(
                  height: 56,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    children: [
                      CategoryChip(label: 'Top', ),
                      CategoryChip(label: 'Popular', ),
                      CategoryChip(label: 'Trending', ),
                      CategoryChip(
                        label: 'Business',
                        
                      ),
                      CategoryChip(label: 'favorites', ),
                      CategoryChip(label: 'Food', ),
                    ],
                  ),
                ),
                // Post tiles
                ...snapshot.data!.map((post) => PostTile(post: post)).toList(),
              ],
            );
          }
        },
      ),
    );
  }
}

// ...existing code ends above. No extra closing braces or parentheses below this line.
