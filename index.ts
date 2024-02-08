import { mergeRequestEvents, NewMergeRequestEvent } from "./tables";
import { sql, type ExtractTablesWithRelations } from "drizzle-orm";
import { type ResultSet } from "@libsql/client";
import { type SQLiteTransaction } from "drizzle-orm/sqlite-core";


function insertMergeRequestEvents(
  tx: SQLiteTransaction<"async", ResultSet, Record<string, unknown>, ExtractTablesWithRelations<Record<string, unknown>>>,
  mre: NewMergeRequestEvent[]) {
  return tx.insert(mergeRequestEvents)
    .values(mre);
}
