import 'package:clean_code_test/core/widgets/circular_indicator_widget.dart';
import 'package:clean_code_test/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:clean_code_test/features/posts/presentation/widgets/post_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostsCubit>().getAllPosts();
            },
          ),
        ],
      ),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is PostsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is PostsLoading) {
            return Center(child: kCircularIndicator());
          } else if (state is PostsLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<PostsCubit>().getAllPosts();
              },
              child:
                  state.posts.isEmpty
                      ? const Center(child: Text('No posts available'))
                      : ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          return PostItemWidget(post: post);
                        },
                      ),
            );
          } else if (state is PostsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostsCubit>().getAllPosts();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No Posts Found'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<PostsCubit>().getAllPosts();
                  },
                  child: const Text('Load Posts'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
