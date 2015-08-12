FROM ubuntu

# ------
#  MISC
# ------
RUN \
    apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    imagemagick

# --------
#  NodeJS
# --------
RUN \
    curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash - && \
    apt-get update && apt-get install -y nodejs

# ------
#  Java
# ------
RUN \
    apt-get update && apt-get install -y openjdk-7-jdk

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# ------
#  xvfb
# ------
RUN \
    apt-get update && apt-get install -y \
    xvfb \
    xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable

ENV DISPLAY=:99

# -----------
#  Webdriver
# -----------
RUN \
    npm install -g protractor && \
    webdriver-manager update

# ----------
#  Browsers
# ----------
RUN \
    apt-get update && apt-get install -y --no-install-recommends \
    chromium-browser \
    firefox

# ----------------
#  Public port(s)
# ----------------
EXPOSE 4444

CMD \
    nohup Xvfb -ac :99 -screen 0 1280x720x16 & \
    webdriver-manager update && \
    nohup webdriver-manager start & \
    tail -f /dev/null
