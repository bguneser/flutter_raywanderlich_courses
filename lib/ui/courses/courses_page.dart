import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/courseRepository.dart';
import 'package:rwcourses/state/filter_state_container.dart';
import 'package:rwcourses/ui/course_detail/course_detail_page.dart';
import 'package:rwcourses/ui/courses/courses_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _CoursesPageState();

}

class _CoursesPageState extends State<CoursesPage>{
  final _controller = CoursesController(CourseRepository());
  FilterState state ;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }



  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(state.filterValue),
      builder: (context,snapshot){
        var courses =snapshot.data;
        if(courses==null || snapshot.connectionState != ConnectionState.done){
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: courses.length,
          itemBuilder: (BuildContext context, int position) {
            return _buildRow(courses[position]);
          },
        );
        
      });
  }
  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Text(course.name, style: TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(course.domainsString),
        trailing: Hero(
          tag: "cardArtwork-${course.courseId}",
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(course.artworkUrl),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CourseDetailsPage(
              course: course,
            )
          ));
        },
      ),
    );
  }

}