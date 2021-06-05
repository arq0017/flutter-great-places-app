class LocationHelper {
  static final publicToken = 'xxx';

  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    //! /styles/v1/{username}/{style_id}/static/{overlay}/{lon},{lat},{zoom},{bearing},{pitch}|{bbox}|{auto}/{width}x{height}{@2x}
    return 'https://api.mapbox.com/{style}/{name}/streets-v11/static/$latitude,$longitude,4.51,0/400x300?access_token=$publicToken';
  }
}
