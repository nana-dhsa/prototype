FROM ubuntu:18.04
RUN apt-get update
RUN apt install curl sudo nano -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# install package
RUN apt install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev \
    libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common \
    libffi-dev nodejs yarn libgdbm-dev libncurses5-dev automake libtool bison libffi-dev -y
#RUN apt install libpq-dev -y
RUN apt install mysql-server mysql-client libmysqlclient-dev -y
#RUN apt install libsqlite3-dev sqlite3 -y

# install ruby rails
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && gpg --keyserver hkp://keys.gnupg.net --recv-keys 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN bash -l -c "touch ~/.bashrc" && \
    bash -l -c "echo source /usr/local/rvm/scripts/rvm | tee -a ~/.bashrc" && \
    bash -l -c "source ~/.bashrc" && \
    bash -l -c "rvm install 2.6.4" && \
    bash -l -c "rvm use 2.6.4 --default" && \
    bash -l -c "gem install bundler" && \
    bash -l -c "gem install rails -v 5.2.4"
