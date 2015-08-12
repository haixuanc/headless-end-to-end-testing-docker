This project will help you to run end-to-end tests for web applications
against real browsers in headless mode. If you have a continous
integration pipeline running on a host with no physical monitor
attached, you can utilize this tool to easily incorporate end-to-end testing
into the pipeline.

It will create a docker with the following installed:

- a Selenium server and webdrivers
- Chrome and Firefox

## Quickstart

A shell script `setup.sh` is provided to streamline the development
lifecycle.

To create a docker image:

```bash
$ ./setup.sh build
```

To create a docker container:

```bash
$ ./setup.sh run
```

Open http://host:4444/wd/hub in a browser to see if the Selenium server is
running.

To stop and remove a running container:

```bash
$ ./setup.sh stop
```

To remove the image:

```bash
$ ./setup.sh delete
```

To create a container and access it:

```bash
$ ./setup.sh dev
```

## Setup a Selenium server locally

For development, it will be more convenient if we can see the browser
window while tests are running. You can quickly setup a Selenium server
locally by following the instructions below.

Utilize protractor to install Selenium and webdrivers:

```bash
$ npm install -g protractor
```

Start a Selenium server:

```bash
$ webdriver-manager update
$ webdriver-manager start
```
