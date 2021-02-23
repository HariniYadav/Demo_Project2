
BASE_URL = "http://api.openweathermap.org/"
REQUEST_URI = "data/2.5/weather?"
API_KEY = "c5ac5d3cf978348e15794044cbb52f0d"
dir = "C:\\Users\HOME\PycharmProjects\Training\OpenWeatherMap\Results"
expected_code = "200"
Browser = "chrome"
SCREENSHOT_NAME = "icon"
LAT = "12.98"
LON = "77.6"


#robot --listener allure_robotframework;AllureReports TestSuites\TC1_getcurrentdata.robot

#robot --listener allure_robotframework;AllureReports TestSuites\TC2_getdataonlatandlon.robot

#allure generate AllureReports --clean
