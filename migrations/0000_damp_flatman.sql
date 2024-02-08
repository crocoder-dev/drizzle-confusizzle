CREATE TABLE `transform_dates` (
	`id` integer PRIMARY KEY NOT NULL,
	`day` integer NOT NULL,
	`week` text NOT NULL,
	`month` integer NOT NULL,
	`year` integer NOT NULL,
	`__created_at` integer DEFAULT (strftime('%s', 'now')),
	`__updated_at` integer DEFAULT (strftime('%s', 'now'))
);
--> statement-breakpoint
CREATE TABLE `transform_forge_users` (
	`id` integer PRIMARY KEY NOT NULL,
	`external_id` integer NOT NULL,
	`forge_type` integer NOT NULL,
	`name` text NOT NULL,
	`bot` integer NOT NULL,
	`__created_at` integer DEFAULT (strftime('%s', 'now')),
	`__updated_at` integer DEFAULT (strftime('%s', 'now'))
);
--> statement-breakpoint
CREATE TABLE `transform_merge_request_events` (
	`id` integer PRIMARY KEY NOT NULL,
	`actor` integer NOT NULL,
	`subject` integer NOT NULL,
	`occured_on` integer NOT NULL,
	`commited_at` integer NOT NULL,
	`repository` integer NOT NULL,
	`merge_request` integer NOT NULL,
	`timestamp` integer NOT NULL,
	`review_state_type` integer NOT NULL,
	`merge_request_event_type` integer NOT NULL,
	`__created_at` integer DEFAULT (strftime('%s', 'now')),
	`__updated_at` integer DEFAULT (strftime('%s', 'now')),
	FOREIGN KEY (`actor`) REFERENCES `transform_forge_users`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`subject`) REFERENCES `transform_forge_users`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`occured_on`) REFERENCES `transform_dates`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`commited_at`) REFERENCES `transform_dates`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`repository`) REFERENCES `transform_repositories`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`merge_request`) REFERENCES `transform_merge_requests`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `transform_merge_requests` (
	`id` integer PRIMARY KEY NOT NULL,
	`external_id` integer NOT NULL,
	`forge_type` integer NOT NULL,
	`title` text NOT NULL,
	`web_url` text NOT NULL,
	`__created_at` integer DEFAULT (strftime('%s', 'now')),
	`__updated_at` integer DEFAULT (strftime('%s', 'now'))
);
--> statement-breakpoint
CREATE TABLE `transform_repositories` (
	`id` integer PRIMARY KEY NOT NULL,
	`external_id` integer NOT NULL,
	`forge_type` integer NOT NULL,
	`name` text NOT NULL,
	`__created_at` integer DEFAULT (strftime('%s', 'now')),
	`__updated_at` integer DEFAULT (strftime('%s', 'now'))
);
--> statement-breakpoint
CREATE UNIQUE INDEX `dates_day_week_month_year_idx` ON `transform_dates` (`day`,`week`,`month`,`year`);--> statement-breakpoint
CREATE INDEX `dates_week_idx` ON `transform_dates` (`week`);--> statement-breakpoint
CREATE UNIQUE INDEX `forge_users_external_id_forge_type_idx` ON `transform_forge_users` (`external_id`,`forge_type`);--> statement-breakpoint
CREATE INDEX `merge_request_events_occured_on_idx` ON `transform_merge_request_events` (`occured_on`);--> statement-breakpoint
CREATE UNIQUE INDEX `merge_requests_external_id_forge_type_idx` ON `transform_merge_requests` (`external_id`,`forge_type`);--> statement-breakpoint
CREATE UNIQUE INDEX `repositories_external_id_forge_type_idx` ON `transform_repositories` (`external_id`,`forge_type`);