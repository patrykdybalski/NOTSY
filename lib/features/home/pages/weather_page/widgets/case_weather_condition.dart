class CaseWeatherCondition {
   String getIconForName(String iconName, DateTime time) {
    // Determine if it's day or night based on the time of day
    bool isDayTime = time.hour >= 6 && time.hour < 18;
    switch (iconName) {
      case "Partly cloudy":
      case "Overcast":
        return isDayTime
            ? 'assets/images/partlyCloudy.png'
            : 'assets/images/nightCloud.png';

      case "Sunny":
      case "Clear":
        return isDayTime ? 'assets/images/sunny.png' : 'assets/images/moon.png';

      case "Light rain":
      case "Light rain shower":
        return isDayTime
            ? 'assets/images/lightRain.png'
            : 'assets/images/nightMidRain.png';

      case "Moderate rain":
        return isDayTime
            ? 'assets/images/moderateRain.png'
            : 'assets/images/nightHighRain.png';

      case "Blizzard":
        return isDayTime
            ? 'assets/images/blizzard.png'
            : 'assets/images/nightCloud.png';

      case "Light snow":
      case "Light snow showers":
        return isDayTime
            ? 'assets/images/snow.png'
            : 'assets/images/nightSnow.png';

      case "Moderate or heavy rain with thunder":
        return isDayTime
            ? 'assets/images/heavyWithThunder.png'
            : 'assets/images/nightRainThunder.png';

      default:
        return isDayTime
            ? 'assets/images/sunny.png'
            : 'assets/images/nightMidRain.png';
    }
  }
}