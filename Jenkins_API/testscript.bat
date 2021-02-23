rmdir /Q /S "C:\Users\HOME\PycharmProjects\Training\Jenkins_API\allure"
robot --listener allure_robotframework;C:\Users\HOME\PycharmProjects\Training\Jenkins_API\allure --outputdir C:\Users\HOME\PycharmProjects\Training\Jenkins_API\Results C:\Users\HOME\PycharmProjects\Training\Jenkins_API\jenkins_demo.robot
allure generate C:\Users\HOME\PycharmProjects\Training\Jenkins_API\allure -o C:\Users\HOME\PycharmProjects\Training\Jenkins_API\allurereport --clean



