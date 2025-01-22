*** Settings ***
Library    SeleniumLibrary
Library    ./../../resources/examples/attach.py  # Import custom Python file

*** Variables ***
${BROWSER}    Chrome
${URL}        https://qase.io
${SCREENSHOT_PATH}    ${CURDIR}/qase.png

*** Test Cases ***
Open "qase.io" and capture a screenshot
    # Open the browser and assign the driver to a variable
    Open Browser    ${URL}    ${BROWSER}

    # Capture screenshot and attach to Qase
    Capture Screenshot And Attach To Qase    ${SCREENSHOT_PATH}
    
    # Close the browser
    Close Browser
