# Roavoid

COVID has completely changed our world. According to the CDC, in only the United States, there have been over 31 million cases with 565K deaths. This pandemic has redefined how we live our lives and how we travel. To reduce risk of COVID exposure, many people are taking road trips rather than flying or other high risk methods. However, even with road trips, there are still large risks. A person could decide to fill gas in a COVID hot spot, and significantly increase their risk for exposure. This is where my app, Roavoid, comes in.  

Roavoid is a two-tab application. The first tab is a map with markers in each state. Each state marker is color-coded and represents the risk level of that state. A user can drop an origin pin and a destination pin on the map. A route will be generated on the map so the user can see the mileage between the two places along with the risk levels in the state.

So far, Roavoid only shows risk factors for the United States.

## File Explanations
Most of the relevant code has been placed in the ./lib/ directory. For each file, look below.

### lib/main.dart
This is where the main app code is stored. Here, we set up:
<ul>
<li /> Bottom navigation bar: this bar is the blue bar are the bottom of our screen. Here, we have two icons. First icon is the one for our map screen, and the second icon is for searching along our route.
<li /> MapScreen: our map screen is the home screen. Here we have a map that we've gotten from the Google Maps API.
<li /> Markers: from the Google Maps API, we use markers to mark our origin, destination, and the risk factor of each state.
</ul>

### lib/secrets.dart
This is where we store the API keys for the APIs we've used. If pulling this code from GitHub, you must get your own key.