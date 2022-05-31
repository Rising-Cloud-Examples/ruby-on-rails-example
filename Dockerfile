FROM ruby:3.1.2

# Install system deps
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

# Copy files
COPY . /ruby-web-service
WORKDIR /ruby-web-service

# Create a clean entrypoint
RUN chmod +x /ruby-web-service/entrypoint.sh
ENTRYPOINT ["/ruby-web-service/entrypoint.sh"]

# Install gems
RUN bundle install

# Expose port 3000
EXPOSE 3000

# Run command
CMD ["rails", "server", "-b", "::"]