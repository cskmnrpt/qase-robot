import os

from qase.robotframework.method import qase
from robot.api.deco import keyword
from selenium import webdriver
from selenium.common.exceptions import WebDriverException

from resources.examples.custom_library import CustomLibrary


@keyword("Capture Screenshot And Attach To Qase")
def capture_and_attach_screenshot(
    screenshot_path: str, save_locally: bool = False
):
    """
    Capture a screenshot of the current page in the browser and attach it to Qase.

    Args:
        driver: The Selenium WebDriver instance.
        screenshot_path: The path to save the screenshot (e.g., 'screenshot.png').
        save_locally: Optional flag to save screenshot locally (default: False)

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        driver = CustomLibrary.get_current_driver()
        # Attach screenshot directly to Qase report
        qase.attach((driver.get_screenshot_as_png(), "image/png", "screenshot.png"))

        # Save the screenshot locally if requested
        if save_locally:
            driver.save_screenshot(screenshot_path)

        return True

    except WebDriverException as e:
        print(f"Failed to capture screenshot: {str(e)}")
        return False
    except Exception as e:
        print(f"Unexpected error: {str(e)}")
        return False
