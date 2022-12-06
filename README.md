# README

This is effective-barnacle, a toy app for administrating jobs between plumbers and clients.
A live version can be found at https://effective-barnacle.fly.dev/

The following credentials can be used both in production, and development after seeding.
```
email:    admin@example.com
password: password
```

### Running locally

After cloning the repo run these commands to set up the data base and dependencies
```
bundle install
bundle exec rails db:create db:migrate db:seed
```

The development server can be started via `./bin/dev`

### API

Effective-barnacle implements a GraphQl API. This can be used to fetch jobs belonging to a plumber, or to mark a job as done.

#### Querying a plumber's jobs

Using the following query we can find the jobs and client details for Plumber with an id of 54321
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

Notice that the client's `private_note` cannot be queried
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

#### Marking a job as done

If we have a job's id then we can use the following query to mark the job done.
```
mutation {
  markJobDone(input: {jobId: "e5758d02-ce9b-4642-b105-096e7a18d2c2"}) {
    job {
      id
      doneAt
    }
  }
}
```
This will return the job with the `done_at` set to the current time
```
{
  "data": {
    "markJobDone": {
      "job": {
        "id": "e5758d02-ce9b-4642-b105-096e7a18d2c2",
        "doneAt": "2022-12-02T06:37:35Z"
      }
    }
  }
}
```

#### Throttling

The GraphQL end point is throttled to 1000 requests/day via the Rack::Attack middleware. Looking at the documentations, it is implied there is a way to step throttling to a second level once the first limit has been reach. But this was not implemented in the time frame.

### Deployment - CD/CI

GitHub Actions are used to run the test suite on push, and a deployment task when a branch is merged to `main`. Feature branches need to be rebased on `main` and conflicts resolved before merging to `main`.

Fly.io was chosen for hosting due to its ease of use and free hobby plan.


### Thoughts

My approach to building this app was to avoid abstraction where ever possible. In my experience an early abstraction can lead to the wrong abstraction, which can be hard to change/move away from. Models are chosen as the home for behaviour, queries, validations, and logic, instead of abstractions such as query or service objects. Anyone with basic Rails experience should be able to work in this code base.

However, I chose to use the view component gem over standard partials. View components prove away to separate logic from the template, e.g. string formatting, or value normalisation. Code in erb files is difficult to read and hard for linting/formatting libraries to parse. This separation creates a better environment for developers leading to less missed errors.

This is my first time using Rails 7, and import maps. While it took a little to get used to, it is a refreshing way that avoids the need a transpiler and the configurations that come with that.
