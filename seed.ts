import { drizzle } from "drizzle-orm/libsql";
import { createClient } from "@libsql/client";
import { seed } from "./tables/seed/dimensions";


const now = new Date();
const MONTH = 30 * 24 * 60 * 60 * 1000;
seed(
  drizzle(
    createClient({
      url: process.env.TURSO_URL!,
      authToken: process.env.TURSO_AUTH_TOKEN!
    })
  ),
  new Date(now.getTime() - 18 * MONTH),
  new Date(now.getTime() + 2 * MONTH)
);


