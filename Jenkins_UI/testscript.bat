rmdir /Q /S "C:\Users\HOME\PycharmProjects\Training\Jenkins_UI\allure"
robot --listener allure_robotframework;C:\Users\HOME\PycharmProjects\Training\Jenkins_UI\allure  -n "NewItem" --outputdir C:\Users\HOME\PycharmProjects\Training\Jenkins_UI\Results C:\Users\HOME\PycharmProjects\Training\Jenkins_UI\TestSuites\TestCases.robot
allure generate C:\Users\HOME\PycharmProjects\Training\Jenkins_UI\allure -o C:\Users\HOME\PycharmProjects\Training\Jenkins_UI\allurereport --clean



