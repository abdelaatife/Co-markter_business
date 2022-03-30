import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//store item
List data = [];
int ind = 0;
List itemsearch = ['abdo', 'ahmed', 'salem'];
// end store item

Map<String, dynamic>? usersData;
AccessToken? accessTokens;

//locaton
Position? clo;
List<Placemark> loc = [];
//images

Map<String, dynamic> image = {
  "imageslinke": {
    "burger":
        "https://www.canva.com/design/DAE7IfzZov8/share/preview?token=AJY4bbFCczc4C0fgpT_XvQ&role=EDITOR&utm_content=DAE7IfzZov8&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton ",
    "soup":
        "https://www.canva.com/design/DAE7IVgkceE/share/preview?token=2I08IaF38TQLb8qLTtUvyg&role=EDITOR&utm_content=DAE7IVgkceE&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton",
    "phonefood":
        "https://www.canva.com/design/DAE7ITBU2wM/share/preview?token=ph8QqqviIoDn5n9xcUPTQg&role=EDITOR&utm_content=DAE7ITBU2wM&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton",
    "gammeday":
        "https://www.canva.com/design/DAE7Ia1u7mU/share/preview?token=C2jeCA758mE0n9NnljcKSQ&role=EDITOR&utm_content=DAE7Ia1u7mU&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton",
    "pizza":
        "https://www.canva.com/design/DAE7IZlerBw/share/preview?token=zoLPeo5YaoW3UHIR6-pjUA&role=EDITOR&utm_content=DAE7IZlerBw&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton",
    "traditional":
        "https://www.canva.com/design/DAE7IQLqH88/share/preview?token=l4D4u3BUJCLSuHzl-KXg5Q&role=EDITOR&utm_content=DAE7IQLqH88&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton"
  },
  "images": {
    "burger": 'assets/images/burger.jpg',
    "soup": 'assets/images/soup.jpg',
    "phonefood": 'assets/images/phonefood.png',
    "gammeday": 'assets/images/gammeday.jpg',
    "pizza": 'assets/images/pizza.jpg',
    "traditional": 'assets/images/traditional.jpg'
  },
};
//social media
Map<String, dynamic> facebookUsersByCountry = {
  "Algeria": {
    "users": {
      "Facebook": {
        "total": 27427700,
        "men": 16045204,
        "women": 11382495,
        "byAge": {
          "Women 13-17": 1200000,
          "Men 13-17": 1100000,
          "Women 18-24": 3900000,
          "Men 18-24": 4000000,
          "Women 25-34": 3600000,
          " Men 25-34": 5500000,
          " Women 35-44": 1600000,
          " Men 35-44": 3200000,
          ", Women 45-54": 618700,
          " Men 45-54": 1300000,
          "  Women 55-64": 286000,
          " Men 55-64": 546000,
          "  Women 65+": 201600,
          " Men 65+": 392700
        }
      },
      "Instagram": {
        "total": 9124300,
        "men": 4954494,
        "women": 4169806,
        "byAge": {
          "Women 13-17": 508400,
          "Men 13-17": 482900,
          "Women 18-24": 1600000,
          "Men 18-24": 1800000,
          "Women 25-34": 1300000,
          " Men 25-34": 1700000,
          " Women 35-44": 469900,
          " Men 35-44": 622800,
          ", Women 45-54": 183600,
          " Men 45-54": 204900,
          "  Women 55-64": 71400,
          " Men 55-64": 77000,
          "  Women 65+": 40400,
          " Men 65+": 63000
        }
      }
    },
    "BestTimeToPost": {
      "facebook": {
        "time": [11, 13, 21, 18],
        "day": [
          {"Wednesday": 22},
          "Saturday",
          "Thersday"
        ]
      },
      "Instagram": {
        "time": [11, 14, 16, 23],
        "day": [
          {"Wednesday": 22},
          "Saturday",
          "Thersday"
        ]
      }
    }
  }
};
//notification
var serverToken =
    'AAAAUAN6Uc0:APA91bHku7ja1xU33XTsK5rIkBmXNi7Kn8hq00a94eF9q8hEXmyAsSgmhf1IuInPSJCDagqL1PidCMMuz-ggBRifMduq1MHeZ2giS1p_5gBG04FRekildg0RhNKrx_ISbFns8Ce5CqiD';

List<String> img = [
  "3288524.jpg",
  "6030259.jpg",
  "Blogging-pana.png",
  "Free shipping-pana.png",
  'Design inspiration-pana.png',
  "Social ideas-cuate.png"
];
Map<String, dynamic> plane = {
  'plane1': {' ffs': 5}
};
var indeximg;

int star = 31;
int midel = 12;
int xp = 24;
int notfi = 2;
List listeoffer = [];
