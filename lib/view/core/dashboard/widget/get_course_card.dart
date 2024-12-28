import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetCourseCard extends StatelessWidget {
  // final Map<String, dynamic> course;
  int? idx;
  String? courseName;
  String? courseDescription;
  GetCourseCard({
    this.courseName,
    this.courseDescription,
    // required this.course,
    this.idx,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          // elevation
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AttributeCardModule(
                      icon: Icons.grid_view_outlined,
                      title: courseName ?? "null",
                    ),
                    AttributeCardModule(
                      icon: Icons.access_time,
                      title: "2h 30m",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  courseName ?? 'null',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  courseDescription ?? 'null',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Container(
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 35,
                      // height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      "Admin",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: Colors.grey,
                      ),
                      onPressed: () {},
                      child: const Text("Enroll",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AttributeCardModule extends StatelessWidget {
  final String title;
  final IconData icon;

  const AttributeCardModule({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 10,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
