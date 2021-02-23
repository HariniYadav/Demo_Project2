# All the locators needed for executing the test case are in this Locators.py file
import datetime

class Values:
    variable = 1
    def get_temp_in_Fahrenheit(self,tempinCelsius):
        float_value = float(tempinCelsius)
        fahrenheit_value = (float_value * 9/5) + 32
        tempinFahrenheit = round(fahrenheit_value, 2)
        return (tempinFahrenheit)

    def get_temp_in_Kelvin(self,tempinCelsius):
        float_value = float(tempinCelsius)
        kelvin_value = (float_value + 273.15)
        tempinKelvin = round(kelvin_value,2)
        return (tempinKelvin)

    def get_datetime(self, unix_timestamp):
        timestamp = datetime.datetime.fromtimestamp(unix_timestamp)
        readable_timestamp = timestamp.strftime("%Y-%m-%d  %I:%M:%S %p")
        return readable_timestamp

    def get_screenshot_filename(self):
        filename = "icon"+str(Values.variable)
        return(filename)

v=Values()
