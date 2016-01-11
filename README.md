# WDL Workflow Webservice

## User stories
```
As a Researcher, I need to upload a new workflow to the CCC.

As a Researcher, I need to run a workflows on the CCC.

As a Researcher, I need to check the status and outputs of workflows run on the CCC.
```

## Requirements

* Ruby (developed using version: 2.2.4p230)
* Rails (developed using version: 4.2.5)
* Redis 2.8 or greater
* PostgresSQL
* Cromwell (https://github.com/broadinstitute/cromwell/)

## Setup
1. Clone this repository.
2. Run `gem bundle install`

## Startup
From the project's root directory run:

1. `bin/rails s` to start a rails server for this application at http://0.0.0.0:3000
2. `bundle exec sidekiq` to kick off Sidekiq (http://sidekiq.org/) which is used for asyncronous execution of workers.
3. `java -jar cromwell-0.14.jar server` to start a cromwell server at http://0.0.0.0:8000

## Resources
* WDL Specification - https://github.com/broadinstitute/wdl/blob/develop/SPEC.md
* Cromwell - https://github.com/broadinstitute/cromwell

