import 'package:flutter/material.dart';
import 'package:roavoid/directions_model.dart';
import 'package:roavoid/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roavoid/SecondScreen.dart';

void main() {
  runApp(MyApp());
}

// Made a class structure for the states to save relevant info
class US_State {
  final String abbreviation;
  final String name;
  final int riskLevel;
  final LatLng coords;
  US_State(
      {@required this.abbreviation,
      @required this.name,
      @required this.riskLevel,
      @required this.coords});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roavoid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 5,
  );

  // Relevant definitions
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  int _selectedIndex = 0;

  //Couldn't do successful API calls so currently hard coding
  //the risk factors for each individual state
  List<Marker> stateMarkers = [];
  List<US_State> states = [];
  void populate_states() {
    states.add(new US_State(
        abbreviation: 'AL',
        name: 'Alabama',
        riskLevel: 2,
        coords: LatLng(32.318230, -86.902298)));
    states.add(US_State(
        abbreviation: 'AK',
        name: 'Alaska',
        riskLevel: 3,
        coords: LatLng(66.160507, -153.369141)));
    states.add(US_State(
        abbreviation: 'AZ',
        name: 'Arizona',
        riskLevel: 1,
        coords: LatLng(34.048927, -111.093735)));
    states.add(US_State(
        abbreviation: 'AR',
        name: 'Arkansas',
        riskLevel: 1,
        coords: LatLng(34.799999, -92.199997)));
    states.add(US_State(
        abbreviation: 'CA',
        name: 'California',
        riskLevel: 1,
        coords: LatLng(36.778259, -119.417931)));
    states.add(US_State(
        abbreviation: 'CO',
        name: 'Colorado',
        riskLevel: 3,
        coords: LatLng(39.113014, -105.358887)));
    states.add(US_State(
        abbreviation: 'CT',
        name: 'Connecticut',
        riskLevel: 3,
        coords: LatLng(41.599998, -72.699997)));
    states.add(US_State(
        abbreviation: 'DE',
        name: 'Delaware',
        riskLevel: 3,
        coords: LatLng(39.000000, -75.500000)));
    states.add(US_State(
        abbreviation: 'FL',
        name: 'Florida',
        riskLevel: 3,
        coords: LatLng(27.994402, -81.760254)));
    states.add(US_State(
        abbreviation: 'GA',
        name: 'Georgia',
        riskLevel: 2,
        coords: LatLng(33.247875, -83.441162)));

    states.add(US_State(
        abbreviation: 'HI',
        name: 'Hawaii',
        riskLevel: 1,
        coords: LatLng(19.741755, -155.844437)));
    states.add(US_State(
        abbreviation: 'ID',
        name: 'Idaho',
        riskLevel: 2,
        coords: LatLng(44.068203, -114.742043)));
    states.add(US_State(
        abbreviation: 'IL',
        name: 'Illinois',
        riskLevel: 2,
        coords: LatLng(40.000000, -89.000000)));
    states.add(US_State(
        abbreviation: 'IN',
        name: 'Indiana',
        riskLevel: 2,
        coords: LatLng(40.273502, -86.126976)));
    states.add(US_State(
        abbreviation: 'IA',
        name: 'Iowa',
        riskLevel: 2,
        coords: LatLng(42.032974, -93.581543)));
    states.add(US_State(
        abbreviation: 'KS',
        name: 'Kansas',
        riskLevel: 2,
        coords: LatLng(38.500000, -98.000000)));
    states.add(US_State(
        abbreviation: 'KY',
        name: 'Kentucky',
        riskLevel: 2,
        coords: LatLng(37.839333, -84.270020)));
    states.add(US_State(
        abbreviation: 'LA',
        name: 'Louisiana',
        riskLevel: 2,
        coords: LatLng(30.391830, -92.329102)));
    states.add(US_State(
        abbreviation: 'ME',
        name: 'Maine',
        riskLevel: 3,
        coords: LatLng(45.367584, -68.972168)));
    states.add(US_State(
        abbreviation: 'MD',
        name: 'Maryland',
        riskLevel: 2,
        coords: LatLng(39.045753, -76.641273)));

    states.add(US_State(
        abbreviation: 'MA',
        name: 'Massachusetts',
        riskLevel: 1,
        coords: LatLng(42.407211, -71.382439)));
    states.add(US_State(
        abbreviation: 'MI',
        name: 'Michigan',
        riskLevel: 3,
        coords: LatLng(44.182205, -84.506836)));
    states.add(US_State(
        abbreviation: 'MN',
        name: 'Minnesota',
        riskLevel: 3,
        coords: LatLng(46.392410, -94.636230)));
    states.add(US_State(
        abbreviation: 'MS',
        name: 'Mississippi',
        riskLevel: 1,
        coords: LatLng(33.000000, -90.000000)));
    states.add(US_State(
        abbreviation: 'MO',
        name: 'Missouri',
        riskLevel: 2,
        coords: LatLng(38.573936, -92.603760)));
    states.add(US_State(
        abbreviation: 'MT',
        name: 'Montana',
        riskLevel: 2,
        coords: LatLng(46.965260, -109.533691)));
    states.add(US_State(
        abbreviation: 'NE',
        name: 'Nebraska',
        riskLevel: 2,
        coords: LatLng(41.500000, -100.000000)));
    states.add(US_State(
        abbreviation: 'NV',
        name: 'Nevada',
        riskLevel: 2,
        coords: LatLng(39.876019, -117.224121)));
    states.add(US_State(
        abbreviation: 'NH',
        name: 'New Hampshire',
        riskLevel: 3,
        coords: LatLng(44.000000, -71.500000)));
    states.add(US_State(
        abbreviation: 'NJ',
        name: 'New Jersey',
        riskLevel: 3,
        coords: LatLng(39.833851, -74.871826)));

    states.add(US_State(
        abbreviation: 'NM',
        name: 'New Mexico',
        riskLevel: 1,
        coords: LatLng(34.307144, -106.018066)));
    states.add(US_State(
        abbreviation: 'NY',
        name: 'New York',
        riskLevel: 3,
        coords: LatLng(43.000000, -75.000000)));
    states.add(US_State(
        abbreviation: 'NC',
        name: 'North Carolina',
        riskLevel: 2,
        coords: LatLng(35.782169, -80.793457)));
    states.add(US_State(
        abbreviation: 'ND',
        name: 'North Dakota',
        riskLevel: 2,
        coords: LatLng(47.650589, -100.437012)));
    states.add(US_State(
        abbreviation: 'OH',
        name: 'Ohio',
        riskLevel: 2,
        coords: LatLng(40.367474, -82.996216)));
    states.add(US_State(
        abbreviation: 'OK',
        name: 'Oklahoma',
        riskLevel: 1,
        coords: LatLng(36.084621, -96.921387)));
    states.add(US_State(
        abbreviation: 'OR',
        name: 'Oregon',
        riskLevel: 2,
        coords: LatLng(44.000000, -120.500000)));
    states.add(US_State(
        abbreviation: 'PN',
        name: 'Pennsylvania',
        riskLevel: 3,
        coords: LatLng(41.203323, -77.194527)));
    states.add(US_State(
        abbreviation: 'RI',
        name: 'Rhode Island',
        riskLevel: 3,
        coords: LatLng(41.700001, -71.500000)));
    states.add(US_State(
        abbreviation: 'SC',
        name: 'South Carolina',
        riskLevel: 2,
        coords: LatLng(33.836082, -81.163727)));
    states.add(US_State(
        abbreviation: 'SD',
        name: 'South Dakota',
        riskLevel: 2,
        coords: LatLng(44.500000, -100.000000)));

    states.add(US_State(
        abbreviation: 'TN',
        name: 'Tennessee',
        riskLevel: 2,
        coords: LatLng(35.860119, -86.660156)));
    states.add(US_State(
        abbreviation: 'TX',
        name: 'Texas',
        riskLevel: 2,
        coords: LatLng(31.000000, -100.000000)));
    states.add(US_State(
        abbreviation: 'UT',
        name: 'Utah',
        riskLevel: 2,
        coords: LatLng(39.419220, -111.950684)));
    states.add(US_State(
        abbreviation: 'VT',
        name: 'Vermont',
        riskLevel: 3,
        coords: LatLng(44.000000, -72.699997)));
    states.add(US_State(
        abbreviation: 'VA',
        name: 'Virginia',
        riskLevel: 2,
        coords: LatLng(37.926868, -78.024902)));
    states.add(US_State(
        abbreviation: 'WA',
        name: 'Washington',
        riskLevel: 2,
        coords: LatLng(47.751076, -120.740135)));
    states.add(US_State(
        abbreviation: 'WV',
        name: 'West Virginia',
        riskLevel: 2,
        coords: LatLng(39.000000, -80.500000)));
    states.add(US_State(
        abbreviation: 'WI',
        name: 'Wisconsin',
        riskLevel: 2,
        coords: LatLng(44.500000, -89.500000)));
    states.add(US_State(
        abbreviation: 'WY',
        name: 'Wyoming',
        riskLevel: 3,
        coords: LatLng(43.075970, -107.290283)));
  }

  void populate_markers() {
    for (var i = 0; i < 50; i++) {
      if (states[i].riskLevel == 1) {
        stateMarkers.add(new Marker(
            markerId: MarkerId(states[i].name),
            position: states[i].coords,
            infoWindow: InfoWindow(title: states[i].name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueYellow)));
      } else if (states[i].riskLevel == 0) {
        stateMarkers.add(new Marker(
            markerId: MarkerId(states[i].name),
            position: states[i].coords,
            infoWindow: InfoWindow(title: states[i].name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen)));
      } else if (states[i].riskLevel == 2) {
        stateMarkers.add(new Marker(
            markerId: MarkerId(states[i].name),
            position: states[i].coords,
            infoWindow: InfoWindow(title: states[i].name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange)));
      } else if (states[i].riskLevel == 3) {
        stateMarkers.add(new Marker(
            markerId: MarkerId(states[i].name),
            position: states[i].coords,
            infoWindow: InfoWindow(title: states[i].name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed)));
      }
      if (states[i].riskLevel == 4) {
        stateMarkers.add(new Marker(
            markerId: MarkerId(states[i].name),
            position: states[i].coords,
            infoWindow: InfoWindow(title: states[i].name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueMagenta)));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    populate_states();
    populate_markers();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Roavoid'),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination,
              stateMarkers[0],
              stateMarkers[1],
              stateMarkers[2],
              stateMarkers[3],
              stateMarkers[4],
              stateMarkers[5],
              stateMarkers[6],
              stateMarkers[7],
              stateMarkers[8],
              stateMarkers[9],
              stateMarkers[10],
              stateMarkers[11],
              stateMarkers[12],
              stateMarkers[13],
              stateMarkers[14],
              stateMarkers[15],
              stateMarkers[16],
              stateMarkers[17],
              stateMarkers[18],
              stateMarkers[19],
              stateMarkers[20],
              stateMarkers[21],
              stateMarkers[22],
              stateMarkers[23],
              stateMarkers[24],
              stateMarkers[25],
              stateMarkers[26],
              stateMarkers[27],
              stateMarkers[28],
              stateMarkers[29],
              stateMarkers[30],
              stateMarkers[31],
              stateMarkers[32],
              stateMarkers[33],
              stateMarkers[34],
              stateMarkers[35],
              stateMarkers[36],
              stateMarkers[37],
              stateMarkers[38],
              stateMarkers[39],
              stateMarkers[40],
              stateMarkers[41],
              stateMarkers[42],
              stateMarkers[43],
              stateMarkers[44],
              stateMarkers[45],
              stateMarkers[46],
              stateMarkers[47],
              stateMarkers[48],
              stateMarkers[49],
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            }
          });
        },
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    // this is used to set up the origin and destination marks
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}
