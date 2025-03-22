# inventures-work-application-backend

## Runtime

Deployment URL: [`https://inventures-work-application-backend.onrender.com`](https://inventures-work-application-backend.onrender.com).

## Dependencies

- Ruby 3.3.0.
- Postgres drivers relative to your OS. For Linux, you can install them with `sudo apt-get install libpq-dev`.
- Postgres database, in case you decide to have it locally set-up (you could instead use, for instance, [Neon](https://neon.tech/) for setting up a remote free Postgres instance, which is more convenient for this toy project).

## Build and run

1. Install the dependencies with `./bin/bundle install`.
2. Create a `.env.local` file and set up the `DATABASE_POSTGRES_CONNECTION_URL` ENV in order to set up the connection with the database server. Check the development preset ENVs at [`.env`](.env).
3. Set up database with `./bin/rake db:create db:migrate` and create fake mock test data if desired with `./bin/rake db:mock`.
4. Start the development server simply with `./bin/rake app:run`. This will serve the Next application at `http://localhost:${DEV_RUNTIME_PORT}`.
