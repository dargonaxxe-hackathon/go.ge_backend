# Use a base image with Elixir and PostgreSQL
FROM elixir:1.15.4

#RUN service postgresql start && \
#    su - postgres -c "psql -c 'CREATE DATABASE myapp_dev;'" && \
#    su - postgres -c "psql -c 'GRANT ALL PRIVILEGES ON DATABASE myapp_dev TO postgres;'" && \
#    service postgresql stop

# Set the working directory
WORKDIR /app

# Install Elixir dependencies
#COPY mix.* ./
#RUN mix do deps.get, deps.compile

# Copy the application code
COPY . .

# Set environment variables
ENV MIX_ENV=dev
ENV PORT=4000
ENV DB_HOST=172.17.0.2
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres

# Expose ports
EXPOSE $PORT

RUN mix local.hex --force

# Command to start the application
CMD ["iex", "-S", "mix", "phx.server"]