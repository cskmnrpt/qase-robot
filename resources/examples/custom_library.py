from robot.libraries.BuiltIn import BuiltIn


class CustomLibrary:
    @staticmethod
    def get_current_driver():
        selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
        return selenium_lib.driver
