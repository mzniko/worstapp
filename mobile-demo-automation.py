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
        # Non-crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

    def test02(self):
        # Non-crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

    def test03(self):
        # MDHomeVC crashing flow...
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
        self.driver.background_app(4)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("This will crash").click()
        sleep(7)

    def test04(self):
        # Non-crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

    def test05(self):
        # Non-crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

    def test06(self):
        # MDHomeVC crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.background_app(4)
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
        self.driver.find_element_by_name("This will crash").click()
        sleep(7)

    def test07(self):
        # MDPremiseVC crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

    def test08(self):
        # MDSystemVC crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

    def test09(self):
        # MDHomeVC crashing flow...
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
        self.driver.background_app(4)
        self.driver.find_element_by_name("Done").click()
        self.driver.find_element_by_name("Login").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("This will crash").click()
        sleep(7)

    def test10(self):
        # Non-crashing flow...
        self.driver.find_element_by_name("Login").click()
        self.driver.background_app(4)
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("System").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIAButton[5]").click()
        self.driver.find_element_by_name("Premise").click()
        self.driver.find_element_by_xpath("//UIAApplication[1]/UIAWindow[1]/UIASwitch[1]").click()
        self.driver.find_element_by_name("Done").click()
        sleep(7)

if __name__ == '__main__':
    while True:
        suite = unittest.TestLoader().loadTestsFromTestCase(MobileDemoTests)
        unittest.TextTestRunner(verbosity=2).run(suite)