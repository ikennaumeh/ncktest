class Item {


  List<String> _images = [
    'https://images.pexels.com/photos/159643/laptop-ipad-organic-natural-159643.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/983831/pexels-photo-983831.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/196659/pexels-photo-196659.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/4158/apple-iphone-smartphone-desk.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/265655/pexels-photo-265655.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/983831/pexels-photo-983831.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/196659/pexels-photo-196659.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/4158/apple-iphone-smartphone-desk.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/265655/pexels-photo-265655.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ];

  List<String> _names = [
    'Google Home',
    'Google Dream',
    'Next Protect',
    'Google Clips',
    'OVR Googles',
    'Google Dream',
    'Next Protect',
    'Google Clips',
    'OVR Googles',
  ];

  List<int> _amount = [
    129, 200, 255, 129, 120, 200, 255, 129, 120,
  ];

  int get length => _images.length;
  get images =>  _images;
  get names => _names;
  get amount => _amount;



}