import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/blog/blog.dart';

import '../../../../core/constants/app_paths.dart';

class BlogLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.blogScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(key: ValueKey('blog'), title: 'blog', child: BlogScreen()),
    ];
    return pages;
  }
}
