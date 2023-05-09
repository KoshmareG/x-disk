# X-Disk

X-Disk is application is an analogue of the [Yandex.Disk](https://disk.yandex.ru/) service for storing documents in the cloud. You can store files in docx, xlsx and zip format. 10 MB of disk space is available for each user.

The application is built on Ruby 3.1.2 and Rails 7.0.4. PostgreSQL and Redis databases. RSpec is used for testing.

## Application start

To run the application, you will need an installed [Docker](https://docs.docker.com/engine/install/) and [Compose](https://docs.docker.com/compose/) plugin.

In the app folder, run

```
$ docker compose build
```

This command will load the necessary images. Next, run the application

```
$ docker compose up
```

When the app starts you will see

```
x-disk-web-1    | => Rails 7.0.4.3 application starting in development
x-disk-web-1    | => Run `bin/rails server --help` for more startup options
x-disk-web-1    | Puma starting in single mode...
x-disk-web-1    | * Puma version: 5.6.5 (ruby 3.1.2-p20) ("Birdie's Version")
x-disk-web-1    | *  Min threads: 5
x-disk-web-1    | *  Max threads: 5
x-disk-web-1    | *  Environment: development
x-disk-web-1    | *          PID: 1
x-disk-web-1    | * Listening on http://0.0.0.0:3000
x-disk-web-1    | Use Ctrl-C to stop
```

At the first start, you need to create a database and run migrations. Open an additional terminal window and run from the application directory

```
$ docker compose exec web rails db:create
$ docker compose exec web rails db:migrate
```

Then build css and js

```
$ docker compose exec web yarn
$ docker compose exec web yarn build
$ docker compose exec web yarn build:css
```

Now the application is ready to work. In the browser, open

```
http://localhost:3000
```

At the following runs, you will only need to run `docker compose up`

## Stop app

To stop the application, run in the new terminal from the application directory

```
$ docker compose down
```

## Database relationship

```
+----------+           +----------+
| user     |           | reord    |
+----------+           +----------+
| id       |-----------| user_id  |
| email    |           | document |
| username |           +----------+
+----------+
```
