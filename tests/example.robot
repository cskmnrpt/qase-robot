*** Settings ***
Documentation    Example Test Suite

*** Test Cases ***
Example Test Case
    [Documentation]    Example test case without opening a browser
    Log    This is a log message
    ${result}    Evaluate    2 + 2
    Should Be Equal As Numbers    ${result}    4
