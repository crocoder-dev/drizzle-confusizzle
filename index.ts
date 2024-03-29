import { mergeRequestEvents, NewMergeRequestEvent, MergeRequest } from "./tables";
import { type ExtractTablesWithRelations, eq } from "drizzle-orm";
import { createClient, type ResultSet } from "@libsql/client";
import { type SQLiteTransaction } from "drizzle-orm/sqlite-core";
import { drizzle } from "drizzle-orm/libsql";


if (!process.argv[2]) {
}

const no = parseInt(process.argv[2], 10) || 56;

console.warn("-------------------------------------");
console.warn("Inserting", no, "merge request events");
console.warn("-------------------------------------");

function deleteMergeRequestEvents(tx: SQLiteTransaction<"async", ResultSet, Record<string, unknown>, ExtractTablesWithRelations<Record<string, unknown>>>, mergeRequestId: MergeRequest["id"]) {
  return tx.delete(mergeRequestEvents)
    .where(
      eq(mergeRequestEvents.mergeRequest, mergeRequestId)
    );
}

function insertMergeRequestEvents(
  tx: SQLiteTransaction<"async", ResultSet, Record<string, unknown>, ExtractTablesWithRelations<Record<string, unknown>>>,
  mre: NewMergeRequestEvent[]) {
  return tx.insert(mergeRequestEvents)
    .values(mre);
}

const db = drizzle(createClient({
  url: process.env.TURSO_URL!,
  authToken: process.env.TURSO_AUTH_TOKEN!
}));

const exampleMergeRequestEvent = {
  actor: 1,
  commitedAt: 1,
  mergeRequest: 1,
  mergeRequestEventType: "noted",
  occuredOn: 1,
  repository: 1,
  reviewState: "unknown",
  subject: 1,
  timestamp: new Date("2006-01-02T15:04:05-07:00"),
} satisfies NewMergeRequestEvent

await db.transaction(async tx => {
  await deleteMergeRequestEvents(tx, exampleMergeRequestEvent.mergeRequest).run();
  await insertMergeRequestEvents(tx, new Array(no).fill(exampleMergeRequestEvent)).run();
});
