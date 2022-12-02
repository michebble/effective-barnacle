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

### API

effective-barnacle implements a GraphQl API. THis can be used to fetch jobs belonging to a plumber.

Using the following query we can find the jobs and client details for PLumber with an id of 54321
```
query {
  plumberJobs(plumberId: 54321) {
    id
    startOn
    doneAt
    client {
      name
      age
    }
  }
}
```

The returned value may look like this
```
{
  "data": {
    "plumberJobs": [
      {
        "id": "e5758d02-ce9b-4642-b105-096e7a18d2c2",
        "startOn": "2022-11-29",
        "doneAt": null,
        "client": {
          "name": "Captain Cutler",
          "age": 55
        }
      },
      {
        "id": "253140a9-62f3-4f61-92d9-9c1d2fd4e79e",
        "startOn": "2022-11-26",
        "doneAt": "2022-12-01T23:23:06Z",
        "client": {
          "name": "Sarah Jenkins",
          "age": 62
        }
      },
    //...
    ]
  }
}
```

Notice that the client's private note cannot be queried
```
query {
  plumberJobs(plumberId: 54321) {
    client {
      privateNote
    }
  }
}
```
```
{
  "errors": [
    {
      "message": "Field 'privateNote' doesn't exist on type 'Client'",
      "locations": [
        {
          "line": 34,
          "column": 9
        }
      ],
      "path": [
        "query",
        "plumberJobs",
        "client",
        "privateNote"
      ],
      "extensions": {
        "code": "undefinedField",
        "typeName": "Client",
        "fieldName": "privateNote"
      }
    }
  ]
}
```
