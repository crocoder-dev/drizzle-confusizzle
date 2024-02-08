import type { Config,  } from "drizzle-kit";

export default {
  schema: "./tables/index.ts",
  out: "./migrations",
  driver: "turso",
  dbCredentials: {
    url: process.env.TURSO_URL!,
    authToken: process.env.TURSO_AUTH_TOKEN!,
  }
} satisfies Config;
