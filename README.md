# drizzle-confusizzle

Very strange hrana issue 

How to:

```
npm i
```

```
cp env.example .env
```
Change the values of the .env with turso url and token.

```
./run.sh
```

Logs that we get:

```
> drizzle-confusizzle@1.0.0 generate
> drizzle-kit generate:sqlite

drizzle-kit: v0.20.14
drizzle-orm: v0.29.3

No config path provided, using default 'drizzle.config.ts'
Reading config file '/home/crocoder-dev/repos/drizzle-confusizzle/drizzle.config.ts'
5 tables
transform_dates 7 columns 2 indexes 0 fks
transform_forge_users 7 columns 1 indexes 0 fks
transform_merge_request_events 12 columns 1 indexes 6 fks
transform_merge_requests 7 columns 1 indexes 0 fks
transform_repositories 6 columns 1 indexes 0 fks

No schema changes, nothing to migrate 😴

> drizzle-confusizzle@1.0.0 seed
> npm run with-env tsx seed.ts


> drizzle-confusizzle@1.0.0 with-env
> dotenv -e ./.env -- tsx seed.ts


> drizzle-confusizzle@1.0.0 push
> npm run with-env drizzle-kit push:sqlite


> drizzle-confusizzle@1.0.0 with-env
> dotenv -e ./.env -- drizzle-kit push:sqlite

No config path provided, using default path
Reading config file '/home/crocoder-dev/repos/drizzle-confusizzle/drizzle.config.ts'
drizzle-kit: v0.20.14
drizzle-orm: v0.29.3


[i] No changes detected

> drizzle-confusizzle@1.0.0 start
> npm run with-env tsx . 56


> drizzle-confusizzle@1.0.0 with-env
> dotenv -e ./.env -- tsx . 56

-------------------------------------
Inserting 56 merge request events
-------------------------------------

> drizzle-confusizzle@1.0.0 start
> npm run with-env tsx . 57


> drizzle-confusizzle@1.0.0 with-env
> dotenv -e ./.env -- tsx . 57

-------------------------------------
Inserting 57 merge request events
-------------------------------------
file:///home/crocoder-dev/repos/drizzle-confusizzle/node_modules/@libsql/client/lib-esm/hrana.js:257
        return new LibsqlError(e.message, code, undefined, e);
               ^

LibsqlError: SERVER_ERROR: Server returned HTTP status 400: SQL text 1 not found
    at mapHranaError (file:///home/crocoder-dev/repos/drizzle-confusizzle/node_modules/@libsql/client/lib-esm/hrana.js:257:16)
    at HttpTransaction.batch (file:///home/crocoder-dev/repos/drizzle-confusizzle/node_modules/@libsql/client/lib-esm/hrana.js:105:19)
    at process.processTicksAndRejections (node:internal/process/task_queues:95:5)
    at <anonymous> (/home/crocoder-dev/repos/drizzle-confusizzle/index.ts:50:3)
    at LibSQLSession.transaction (/home/crocoder-dev/repos/drizzle-confusizzle/node_modules/src/libsql/session.ts:86:19)
    at <anonymous> (/home/crocoder-dev/repos/drizzle-confusizzle/index.ts:48:1) {
  code: 'SERVER_ERROR',
  rawCode: undefined,
  [cause]: HttpServerError: Server returned HTTP status 400: SQL text 1 not found
      at errorFromResponse (file:///home/crocoder-dev/repos/drizzle-confusizzle/node_modules/@libsql/hrana-client/lib-esm/http/stream.js:363:12)
      at process.processTicksAndRejections (node:internal/process/task_queues:95:5) {
    status: 400
  }
}

Node.js v18.17.1
```

