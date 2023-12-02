const String apiUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/";
const String apiKey = "WiRqmPm4mBO4ssOsQL7uWDS0lJO4KviJ";

String getApiKeyPath() {
  return "?api-key=$apiKey";
}

String getArticlePath(int period) {
  return "all-sections/${period.toString()}.json${getApiKeyPath()}";
}
