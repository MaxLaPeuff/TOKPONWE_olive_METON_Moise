import 'package:flutter/material.dart';
import 'candidate.dart';
import 'candidate_details_page.dart';
import 'friends_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Candidate> candidates = [
    Candidate(
      name: 'Adewole Adebayo',
      description: 'Candidat sérieux et engagé pour l\'éducation',
      party: 'Parti de l\'éducation',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/b0/ADEWOLE_ADEBAYO.jpg',
    ),
    Candidate(
      name: 'Atiku Abubakar',
      description: 'Expert en économie et innovation',
      party: 'Parti de l\'innovation',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/7/76/Atiku_Abubakar-2010_%28cropped%29.jpg',
    ),
    Candidate(
      name: 'Bola Ahmed Tinubu',
      description: 'Passionné par les questions environnementales',
      party: 'Parti vert',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Bola_Tinubu_portrait.jpg/800px-Bola_Tinubu_portrait.jpg',
    ),
    Candidate(
      name: 'Rabiu Mussa Kwankwaso',
      description: 'Défenseur des droits de l\'homme',
      party: 'Parti des droits de l\'homme',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/d/d7/Rabiu_Kwankwaso.jpg',
    ),
  ];

  void addCandidate(Candidate candidate) {
    setState(() {
      candidates.add(candidate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elections'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 202, 74),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FriendsPage(
                onCandidateAdded: addCandidate,
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 33, 187, 56),
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CandidateDetailsPage(candidate: candidates[index]),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      candidates[index].imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    candidates[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(candidates[index].description),
                      Text('Parti: ${candidates[index].party}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.person_remove),
                  onPressed: () {},
                ),
                Text(
                  'Paramètre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.how_to_vote),
                  onPressed: () {},
                ),
                Text(
                  'Vote',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                Text(
                  'Paramètre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
