FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y libpq-dev
ENV HOME /petpark
RUN mkdir $HOME
WORKDIR $HOME
ADD Gemfile $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock
RUN bundle install
ADD . $HOME 
