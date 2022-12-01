# README

This is effective-barnacle, a toy app for administrating jobs between plumbers and clients.
A live version can be found at https://effective-barnacle.fly.dev/

The following credentials can be used both in production, and development after seeding.
```
email:    admin@example.com
password: password
```

### Development

After cloning the repo run these commands to set up the data base and dependencies
```
bundle install
bundle exec rails db:create
bundle exec rails db:seed
```

The development server can be started via `./bin/dev`

Please see above for admin credentials
