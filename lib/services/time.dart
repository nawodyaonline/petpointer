class NowTime {
  String getTimeGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour > 0 && hour < 12) {
      return "Good Morning";
    } else if (hour > 12 && hour < 15) {
      return "Good Afternoon";
    } else if (hour > 15 && hour < 19) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }
}
