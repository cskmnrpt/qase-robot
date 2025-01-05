# qase-robotframework

This is an example repository with tests in the `tests/examples/` directory. To run the tests :

1. Clone the repository with `git clone https://github.com/cskmnrpt/qase-robot.git`.
   To clone a different branch, other than `main`, use this command - <br> `git clone --single-branch --branch <branch-name> https://github.com/cskmnrpt/qase-robot.git`

2. Create a virtual environment with `virtualenv venv`, and activate it with `source venv/bin/activate`.

3. Run `pip install -r requirements.txt` from the root of this repository to install dependencies.

4. Install `chromedriver` from Brew: `brew install --cask chromedriver`, or download the latest version from [here](https://googlechromelabs.github.io/chrome-for-testing/), and add it to your PATH.

5. Create a `qase.config.json` in the root of the repository, and add your token, and project code.

6. Run `robot --listener qase.robotframework.Listener tests/*.robot`
