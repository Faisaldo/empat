import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> availableBooks = List<String>.generate(50, (index) => 'Book ${index + 1}');
  final List<String> registeredMembers = List<String>.generate(20, (index) => 'Member ${index + 1}');
  final List<String> upcomingBooks = List<String>.generate(5, (index) => 'Upcoming Book ${index + 1}');
  final List<String> libraryEvents = ['Event 1: Book Fair', 'Event 2: Author Meet and Greet'];
  final String libraryInfo =
      'Perpustakaan ini didirikan pada tahun 2015 dan telah melayani komunitas dengan berbagai koleksi buku dan sumber daya pendidikan. '
      'Perpustakaan ini tidak hanya menjadi tempat untuk membaca, tetapi juga menjadi pusat kegiatan sosial dan pendidikan bagi masyarakat. '
      'Dengan berbagai program yang diadakan setiap bulannya, perpustakaan ini terus berupaya untuk meningkatkan minat baca dan pengetahuan masyarakat di sekitarnya.';

  final List<String> imgList = [
    'https://arb.umn.edu/sites/arb.umn.edu/files/2022-11/general-page-hero_ahl.jpg',
    'https://hijauku.com/wp-content/uploads/2011/02/timetrax23-@-Flickr.jpg',
    'https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-the-background-photography-of-the-empty-library-bookstore-indoors-image_785539.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang di Dashboard Perpustakaan!'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true),
              items: imgList.map((item) => Container(
                child: Center(
                  child: Image.network(item, fit: BoxFit.cover, width: 1000)
                ),
              )).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Selamat Datang di Perpustakaan!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AvailableBooksPage(availableBooks: availableBooks)),
                      );
                    },
                    child: Card(
                      color: Colors.blue[100],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.book, size: 50),
                            SizedBox(height: 10),
                            Text('Buku Tersedia', style: TextStyle(fontSize: 18)),
                            Text('50', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Lihat Buku'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisteredMembersPage(registeredMembers: registeredMembers)),
                      );
                    },
                    child: Card(
                      color: Colors.green[100],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.people, size: 50),
                            SizedBox(height: 10),
                            Text('Anggota Terdaftar', style: TextStyle(fontSize: 18)),
                            Text('20', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Lihat Anggota'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpcomingBooksPage(upcomingBooks: upcomingBooks)),
                );
              },
              leading: Icon(Icons.bookmark, color: Colors.blue),
              title: Text('Buku Baru'),
              subtitle: Text('Daftar buku baru yang akan terbit.'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LibraryEventsPage(libraryEvents: libraryEvents)),
                );
              },
              leading: Icon(Icons.event, color: Colors.green),
              title: Text('Event Perpustakaan'),
              subtitle: Text('Informasi event dan kegiatan yang akan datang di perpustakaan.'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LibraryInfoPage(libraryInfo: libraryInfo)),
                );
              },
              leading: Icon(Icons.info, color: Colors.orange),
              title: Text('Informasi Perpustakaan'),
              subtitle: Text('Sejarah singkat tentang perpustakaan ini.'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BorrowBookPage(availableBooks: availableBooks, registeredMembers: registeredMembers)),
                );
              },
              leading: Icon(Icons.book, color: Colors.red),
              title: Text('Peminjaman Buku'),
              subtitle: Text('Formulir peminjaman buku.'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableBooksPage extends StatelessWidget {
  final List<String> availableBooks;

  AvailableBooksPage({required this.availableBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buku Tersedia'),
      ),
      body: ListView.builder(
        itemCount: availableBooks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.book, color: Colors.blue),
            title: Text(availableBooks[index]),
          );
        },
      ),
    );
  }
}

class RegisteredMembersPage extends StatelessWidget {
  final List<String> registeredMembers;

  RegisteredMembersPage({required this.registeredMembers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anggota Terdaftar'),
      ),
      body: ListView.builder(
        itemCount: registeredMembers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text(registeredMembers[index]),
          );
        },
      ),
    );
  }
}

class UpcomingBooksPage extends StatelessWidget {
  final List<String> upcomingBooks;

  UpcomingBooksPage({required this.upcomingBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buku Baru'),
      ),
      body: ListView.builder(
        itemCount: upcomingBooks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.bookmark, color: Colors.blue),
            title: Text(upcomingBooks[index]),
          );
        },
      ),
    );
  }
}

class LibraryEventsPage extends StatelessWidget {
  final List<String> libraryEvents;

  LibraryEventsPage({required this.libraryEvents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Perpustakaan'),
      ),
      body: ListView.builder(
        itemCount: libraryEvents.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.event, color: Colors.green),
            title: Text(libraryEvents[index]),
          );
        },
      ),
    );
  }
}

class LibraryInfoPage extends StatelessWidget {
  final String libraryInfo;

  LibraryInfoPage({required this.libraryInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Perpustakaan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Informasi Perpustakaan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                libraryInfo,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BorrowBookPage extends StatefulWidget {
  final List<String> availableBooks;
  final List<String> registeredMembers;

  BorrowBookPage({required this.availableBooks, required this.registeredMembers});

  @override
  _BorrowBookPageState createState() => _BorrowBookPageState();
}

class _BorrowBookPageState extends State<BorrowBookPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedBook;
  String? _selectedMember;
  DateTime? _borrowDate;
  DateTime? _returnDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Peminjaman Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Pilih Buku'),
                items: widget.availableBooks.map((String book) {
                  return DropdownMenuItem<String>(
                    value: book,
                    child: Text(book),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBook = value;
                  });
                },
                validator: (value) => value == null ? 'Pilih buku' : null,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Pilih Anggota'),
                items: widget.registeredMembers.map((String member) {
                  return DropdownMenuItem<String>(
                    value: member,
                    child: Text(member),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMember = value;
                  });
                },
                validator: (value) => value == null ? 'Pilih anggota' : null,
              ),
              ListTile(
                title: Text(_borrowDate == null
                    ? 'Pilih Tanggal Peminjaman'
                    : 'Tanggal Peminjaman: ${_borrowDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _borrowDate) {
                    setState(() {
                      _borrowDate = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: Text(_returnDate == null
                    ? 'Pilih Tanggal Pengembalian'
                    : 'Tanggal Pengembalian: ${_returnDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(Duration(days: 7)),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _returnDate) {
                    setState(() {
                      _returnDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the borrowing logic here
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buku berhasil dipinjam!')));
                    }
                  },
                  child: Text('Pinjam Buku'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}
