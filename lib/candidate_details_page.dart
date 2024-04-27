import 'package:flutter/material.dart';
import 'candidate.dart';

class CandidateDetailsPage extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsPage({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Candidat'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              candidate.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                candidate.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(candidate.description),
            SizedBox(height: 10),
            Text(
              'Parti politique:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(candidate.party),
            SizedBox(height: 20),
            Text(
              'Informations sur le candidat:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim. Fusce est.Vivamus a tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci. Aenean nec lorem',
            ),
          ],
        ),
      ),
    );
  }
}
