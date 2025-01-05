*** Settings ***
Library    ../../resources/examples/steps.py

*** Test Cases ***

Test with defined Suite
    [Tags]    qase.fields:{ "suite": "Parent suite" }
    Step 01
    Step 02

Test with defined Suite: Nested
    [Tags]    qase.fields:{ "suite": "Parent suite\tChild suite" }
    Step 01
    Step 02
