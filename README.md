## Setup a Selenium server inside a docker

Create a docker image:

```bash
$ ./setup.sh build
```

Create a docker container:

```bash
$ ./setup.sh run
```

Open http://host:4444/wd/hub in a browser to see if the server is
running.

## Setup a Selenium server locally

Install the dependencies:

```bash
$ npm install -g protractor
```

Start the server:

```bash
$ webdriver-manager update
$ webdriver-manager start
```
