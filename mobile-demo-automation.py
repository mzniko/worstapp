"""
New Relic MobileDemo Tests
"""
import unittest
import os
# from random import randint
from appium import webdriver
from time import sleep

class MobileDemoTests(unittest.TestCase):
    "Class to run tests against the MobileDemo app"
    def setUp(self):
        "Setup for the test"
        desired_caps = {}
        desired_caps['platformName'] = 'iOS'
        desired_caps['platformVersion'] = '7.1'
        desired_caps['deviceName'] = 'iPhone Simulator'
        desired_caps['app'] = os.path.abspath(os.path.join(os.path.dirname(__file__),'/Users/mobile/Desktop/MobileDemo.app'))
        desired_caps['appPackage'] = 'com.newrelic.MobileDemo'

        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
        self.driver.implicitly_wait(60)

    # def tearDown(self):
    #     "Tear down the test"
    #     self.driver.quit()

    def test01(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

    def test02(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

    def test03(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Failure to Screen").click()
        sleep(10)

    def test04(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

    def test05(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

    def test06(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Failure to Screen").click()
        sleep(10)

    def test07(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

    def test08(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

    def test09(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Failure to Screen").click()
        sleep(10)

    def test10(self):
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.background_app(5)
        self.driver.find_element_by_name("Done").click()
        sleep(10)

if __name__ == '__main__':
    while True:
        suite = unittest.TestLoader().loadTestsFromTestCase(MobileDemoTests)
        unittest.TextTestRunner(verbosity=2).run(suite)