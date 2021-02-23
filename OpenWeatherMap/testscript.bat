rmdir /Q /S "C:\Users\HOME\PycharmProjects\Training\OpenWeatherMap\allure"
pabot --processes 2 --listener allure_robotframework;C:\Users\HOME\PycharmProjects\Training\OpenWeatherMap\allure  -n "Geographical Coordinates" --outputdir C:\Users\HOME\PycharmProjects\Training\OpenWeatherMap\Results C:/Users/HOME/PycharmProjects/Training/OpenWeatherMap/TestSuites/
cd C:\Users\Home\PycharmProjects\Training\OpenWeatherMap\Results
robotmetrics -M C:\Users\Home\PycharmProjects\Training\OpenWeatherMap\Results\regression_metrics.html
cd C:\Users\Home
allure generate C:\Users\HOME\PycharmProjects\Training\OpenWeatherMap\allure -o C:\Users\HOME\PycharmProjects\Training\OpenWeatherMap\allurereport --clean




