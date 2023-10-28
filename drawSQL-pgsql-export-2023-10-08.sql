CREATE TABLE "schedules"(
    "schedule_id" BIGINT NOT NULL,
    "booking_id" BIGINT NOT NULL,
    "start_date" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "end_date" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "date" DATE NOT NULL
);
ALTER TABLE
    "schedules" ADD PRIMARY KEY("schedule_id");
CREATE TABLE "booking"(
    "booking_id" BIGINT NOT NULL,
    "brief_desc" VARCHAR(255) NOT NULL,
    "desc" TEXT NULL,
    "user_id" BIGINT NOT NULL,
    "start_date" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "end_date" TIME(0) WITHOUT TIME ZONE NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "modified_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "repeatable" BOOLEAN NOT NULL,
    "room_id" BIGINT NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "booking_type" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "booking" ADD PRIMARY KEY("booking_id");
CREATE TABLE "rooms"(
    "room_id" BIGINT NOT NULL,
    "capacity" BIGINT NOT NULL,
    "facility" TEXT NOT NULL,
    "room_name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "available" BOOLEAN NOT NULL
);
ALTER TABLE
    "rooms" ADD PRIMARY KEY("room_id");
CREATE TABLE "role"(
    "role_id" SMALLINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "role" ADD PRIMARY KEY("role_id");
CREATE TABLE "logactivity"(
    "log_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "activity" TEXT NOT NULL,
    "date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "logactivity" ADD PRIMARY KEY("log_id");
CREATE TABLE "users"(
    "user_id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "role_id" SMALLINT NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "email" BIGINT NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_username_unique" UNIQUE("username");
ALTER TABLE
    "schedules" ADD CONSTRAINT "schedules_booking_id_foreign" FOREIGN KEY("booking_id") REFERENCES "booking"("booking_id");
ALTER TABLE
    "logactivity" ADD CONSTRAINT "logactivity_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_role_id_foreign" FOREIGN KEY("role_id") REFERENCES "role"("role_id");
ALTER TABLE
    "booking" ADD CONSTRAINT "booking_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "booking" ADD CONSTRAINT "booking_room_id_foreign" FOREIGN KEY("room_id") REFERENCES "rooms"("room_id");