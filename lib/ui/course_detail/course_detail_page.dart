import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/ui/course_detail/image_container.dart';
import 'package:rwcourses/utils/string_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailsPage extends StatelessWidget {
  final Course course;

  CourseDetailsPage({Key key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(course.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(),
            _buildMain(context),
            _buildDetails(context),
            TextButton(
                child: Text("View Course"),
                onPressed: () => _launchCourse(course.courseId))
          ],
        ));
  }

  Widget _buildBanner() {
    return Hero(
      tag: "cardArtwork-${course.courseId}",
      transitionOnUserGestures: true,
      child: ImageContainer(height: 200, url: course.artworkUrl),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            course.name,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 24),
          ),
          Text(
            course.description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    final style = TextStyle(fontSize: 16);

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Domain(s): ${course.domainsString}',
            style: style,
          ),
          Text('Level: ${course.difficulty.capitalize()}'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${course.contributors}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  void _launchCourse(String courseId) {
    launch("https://raywenderlich.com/$courseId");
  }
}
