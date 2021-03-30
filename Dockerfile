FROM ruby:2.3.5

#Update and install required packages.
RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs

#Create and switch to 'mysms' directory
RUN mkdir /mysms
WORKDIR /mysms

#Copy gemfiles and build
COPY Gemfile /mysms/Gemfile
COPY Gemfile.lock /mysms/Gemfile.lock
RUN bundle install

#Copy application into `mysms` directory
COPY . /mysms

EXPOSE 3000
