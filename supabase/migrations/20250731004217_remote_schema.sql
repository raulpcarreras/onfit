alter table "public"."profiles" drop constraint "profiles_id_fkey";

create table "public"."achievements" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null,
    "description" text,
    "points" integer,
    "category" text,
    "icon_url" text,
    "created_at" timestamp with time zone default now()
);


alter table "public"."achievements" enable row level security;

create table "public"."comments" (
    "id" uuid not null default uuid_generate_v4(),
    "social_post_id" uuid,
    "profile_id" uuid,
    "content" text not null,
    "created_at" timestamp with time zone default now()
);


alter table "public"."comments" enable row level security;

create table "public"."daily_nutrition_logs" (
    "id" uuid not null default uuid_generate_v4(),
    "profile_id" uuid,
    "date" date not null,
    "total_calories_consumed" integer,
    "total_protein_grams" integer,
    "total_carbs_grams" integer,
    "total_fat_grams" integer,
    "meals" jsonb,
    "water_intake_ml" integer,
    "notes" text,
    "created_at" timestamp with time zone default now()
);


alter table "public"."daily_nutrition_logs" enable row level security;

create table "public"."exercises" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null,
    "description" text,
    "muscle_groups" text[],
    "equipment_needed" text[],
    "difficulty_level" text,
    "video_url" text,
    "calories_burned_per_minute" numeric(5,2),
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."exercises" enable row level security;

create table "public"."friends" (
    "id" uuid not null default uuid_generate_v4(),
    "profile_id1" uuid,
    "profile_id2" uuid,
    "status" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."friends" enable row level security;

create table "public"."likes" (
    "id" uuid not null default uuid_generate_v4(),
    "social_post_id" uuid,
    "profile_id" uuid,
    "created_at" timestamp with time zone default now()
);


alter table "public"."likes" enable row level security;

create table "public"."nutrition_plans" (
    "id" uuid not null default uuid_generate_v4(),
    "profile_id" uuid,
    "name" text not null,
    "description" text,
    "total_calories" integer,
    "protein_grams" integer,
    "carbs_grams" integer,
    "fat_grams" integer,
    "diet_type" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."nutrition_plans" enable row level security;

create table "public"."programs" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null,
    "description" text,
    "difficulty_level" text,
    "duration_weeks" integer,
    "category" text,
    "tags" text[],
    "is_public" boolean default true,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."programs" enable row level security;

create table "public"."social_posts" (
    "id" uuid not null default uuid_generate_v4(),
    "profile_id" uuid,
    "content" text not null,
    "media_urls" text[],
    "workout_reference" uuid,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."social_posts" enable row level security;

create table "public"."user_achievements" (
    "id" uuid not null default uuid_generate_v4(),
    "profile_id" uuid,
    "achievement_id" uuid,
    "date_earned" timestamp with time zone default now()
);


alter table "public"."user_achievements" enable row level security;

create table "public"."user_exercises" (
    "id" uuid not null default uuid_generate_v4(),
    "profile_id" uuid,
    "exercise_id" uuid,
    "date_performed" date not null,
    "sets" integer,
    "reps" integer,
    "weight" numeric(6,2),
    "duration_minutes" numeric(5,2),
    "notes" text,
    "perceived_difficulty" integer,
    "created_at" timestamp with time zone default now()
);


alter table "public"."user_exercises" enable row level security;

alter table "public"."profiles" drop column "display_name";

alter table "public"."profiles" add column "age" integer;

alter table "public"."profiles" add column "email" text;

alter table "public"."profiles" add column "fitness_goals" jsonb;

alter table "public"."profiles" add column "full_name" text;

alter table "public"."profiles" add column "gender" text;

alter table "public"."profiles" add column "height" numeric(5,2);

alter table "public"."profiles" add column "updated_at" timestamp with time zone default now();

alter table "public"."profiles" add column "user_id" uuid;

alter table "public"."profiles" add column "username" text not null;

alter table "public"."profiles" add column "weight" numeric(5,2);

alter table "public"."profiles" alter column "id" set default uuid_generate_v4();

CREATE UNIQUE INDEX achievements_name_key ON public.achievements USING btree (name);

CREATE UNIQUE INDEX achievements_pkey ON public.achievements USING btree (id);

CREATE UNIQUE INDEX comments_pkey ON public.comments USING btree (id);

CREATE UNIQUE INDEX daily_nutrition_logs_pkey ON public.daily_nutrition_logs USING btree (id);

CREATE UNIQUE INDEX exercises_pkey ON public.exercises USING btree (id);

CREATE UNIQUE INDEX friends_pkey ON public.friends USING btree (id);

CREATE UNIQUE INDEX friends_profile_id1_profile_id2_key ON public.friends USING btree (profile_id1, profile_id2);

CREATE INDEX idx_comments_social_post_id ON public.comments USING btree (social_post_id);

CREATE INDEX idx_daily_nutrition_logs_profile_id ON public.daily_nutrition_logs USING btree (profile_id);

CREATE INDEX idx_friends_profile_ids ON public.friends USING btree (profile_id1, profile_id2);

CREATE INDEX idx_likes_social_post_id ON public.likes USING btree (social_post_id);

CREATE INDEX idx_nutrition_plans_profile_id ON public.nutrition_plans USING btree (profile_id);

CREATE INDEX idx_profiles_user_id ON public.profiles USING btree (user_id);

CREATE INDEX idx_social_posts_profile_id ON public.social_posts USING btree (profile_id);

CREATE INDEX idx_user_achievements_profile_id ON public.user_achievements USING btree (profile_id);

CREATE INDEX idx_user_exercises_exercise_id ON public.user_exercises USING btree (exercise_id);

CREATE INDEX idx_user_exercises_profile_id ON public.user_exercises USING btree (profile_id);

CREATE UNIQUE INDEX likes_pkey ON public.likes USING btree (id);

CREATE UNIQUE INDEX likes_social_post_id_profile_id_key ON public.likes USING btree (social_post_id, profile_id);

CREATE UNIQUE INDEX nutrition_plans_pkey ON public.nutrition_plans USING btree (id);

CREATE UNIQUE INDEX profiles_user_id_key ON public.profiles USING btree (user_id);

CREATE UNIQUE INDEX profiles_username_key ON public.profiles USING btree (username);

CREATE UNIQUE INDEX programs_pkey ON public.programs USING btree (id);

CREATE UNIQUE INDEX social_posts_pkey ON public.social_posts USING btree (id);

CREATE UNIQUE INDEX user_achievements_pkey ON public.user_achievements USING btree (id);

CREATE UNIQUE INDEX user_achievements_profile_id_achievement_id_key ON public.user_achievements USING btree (profile_id, achievement_id);

CREATE UNIQUE INDEX user_exercises_pkey ON public.user_exercises USING btree (id);

alter table "public"."achievements" add constraint "achievements_pkey" PRIMARY KEY using index "achievements_pkey";

alter table "public"."comments" add constraint "comments_pkey" PRIMARY KEY using index "comments_pkey";

alter table "public"."daily_nutrition_logs" add constraint "daily_nutrition_logs_pkey" PRIMARY KEY using index "daily_nutrition_logs_pkey";

alter table "public"."exercises" add constraint "exercises_pkey" PRIMARY KEY using index "exercises_pkey";

alter table "public"."friends" add constraint "friends_pkey" PRIMARY KEY using index "friends_pkey";

alter table "public"."likes" add constraint "likes_pkey" PRIMARY KEY using index "likes_pkey";

alter table "public"."nutrition_plans" add constraint "nutrition_plans_pkey" PRIMARY KEY using index "nutrition_plans_pkey";

alter table "public"."programs" add constraint "programs_pkey" PRIMARY KEY using index "programs_pkey";

alter table "public"."social_posts" add constraint "social_posts_pkey" PRIMARY KEY using index "social_posts_pkey";

alter table "public"."user_achievements" add constraint "user_achievements_pkey" PRIMARY KEY using index "user_achievements_pkey";

alter table "public"."user_exercises" add constraint "user_exercises_pkey" PRIMARY KEY using index "user_exercises_pkey";

alter table "public"."achievements" add constraint "achievements_name_key" UNIQUE using index "achievements_name_key";

alter table "public"."achievements" add constraint "achievements_points_check" CHECK ((points > 0)) not valid;

alter table "public"."achievements" validate constraint "achievements_points_check";

alter table "public"."comments" add constraint "comments_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."comments" validate constraint "comments_profile_id_fkey";

alter table "public"."comments" add constraint "comments_social_post_id_fkey" FOREIGN KEY (social_post_id) REFERENCES social_posts(id) ON DELETE CASCADE not valid;

alter table "public"."comments" validate constraint "comments_social_post_id_fkey";

alter table "public"."daily_nutrition_logs" add constraint "daily_nutrition_logs_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."daily_nutrition_logs" validate constraint "daily_nutrition_logs_profile_id_fkey";

alter table "public"."exercises" add constraint "exercises_difficulty_level_check" CHECK ((difficulty_level = ANY (ARRAY['beginner'::text, 'intermediate'::text, 'advanced'::text]))) not valid;

alter table "public"."exercises" validate constraint "exercises_difficulty_level_check";

alter table "public"."friends" add constraint "friends_check" CHECK ((profile_id1 <> profile_id2)) not valid;

alter table "public"."friends" validate constraint "friends_check";

alter table "public"."friends" add constraint "friends_profile_id1_fkey" FOREIGN KEY (profile_id1) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."friends" validate constraint "friends_profile_id1_fkey";

alter table "public"."friends" add constraint "friends_profile_id1_profile_id2_key" UNIQUE using index "friends_profile_id1_profile_id2_key";

alter table "public"."friends" add constraint "friends_profile_id2_fkey" FOREIGN KEY (profile_id2) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."friends" validate constraint "friends_profile_id2_fkey";

alter table "public"."friends" add constraint "friends_status_check" CHECK ((status = ANY (ARRAY['pending'::text, 'accepted'::text, 'blocked'::text]))) not valid;

alter table "public"."friends" validate constraint "friends_status_check";

alter table "public"."likes" add constraint "likes_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."likes" validate constraint "likes_profile_id_fkey";

alter table "public"."likes" add constraint "likes_social_post_id_fkey" FOREIGN KEY (social_post_id) REFERENCES social_posts(id) ON DELETE CASCADE not valid;

alter table "public"."likes" validate constraint "likes_social_post_id_fkey";

alter table "public"."likes" add constraint "likes_social_post_id_profile_id_key" UNIQUE using index "likes_social_post_id_profile_id_key";

alter table "public"."nutrition_plans" add constraint "nutrition_plans_diet_type_check" CHECK ((diet_type = ANY (ARRAY['balanced'::text, 'keto'::text, 'vegetarian'::text, 'vegan'::text, 'paleo'::text]))) not valid;

alter table "public"."nutrition_plans" validate constraint "nutrition_plans_diet_type_check";

alter table "public"."nutrition_plans" add constraint "nutrition_plans_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."nutrition_plans" validate constraint "nutrition_plans_profile_id_fkey";

alter table "public"."nutrition_plans" add constraint "nutrition_plans_total_calories_check" CHECK ((total_calories > 0)) not valid;

alter table "public"."nutrition_plans" validate constraint "nutrition_plans_total_calories_check";

alter table "public"."profiles" add constraint "profiles_age_check" CHECK ((age > 0)) not valid;

alter table "public"."profiles" validate constraint "profiles_age_check";

alter table "public"."profiles" add constraint "profiles_gender_check" CHECK ((gender = ANY (ARRAY['male'::text, 'female'::text, 'other'::text]))) not valid;

alter table "public"."profiles" validate constraint "profiles_gender_check";

alter table "public"."profiles" add constraint "profiles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_user_id_fkey";

alter table "public"."profiles" add constraint "profiles_user_id_key" UNIQUE using index "profiles_user_id_key";

alter table "public"."profiles" add constraint "profiles_username_key" UNIQUE using index "profiles_username_key";

alter table "public"."programs" add constraint "programs_difficulty_level_check" CHECK ((difficulty_level = ANY (ARRAY['beginner'::text, 'intermediate'::text, 'advanced'::text]))) not valid;

alter table "public"."programs" validate constraint "programs_difficulty_level_check";

alter table "public"."programs" add constraint "programs_duration_weeks_check" CHECK ((duration_weeks > 0)) not valid;

alter table "public"."programs" validate constraint "programs_duration_weeks_check";

alter table "public"."social_posts" add constraint "social_posts_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."social_posts" validate constraint "social_posts_profile_id_fkey";

alter table "public"."social_posts" add constraint "social_posts_workout_reference_fkey" FOREIGN KEY (workout_reference) REFERENCES user_exercises(id) not valid;

alter table "public"."social_posts" validate constraint "social_posts_workout_reference_fkey";

alter table "public"."user_achievements" add constraint "user_achievements_achievement_id_fkey" FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE not valid;

alter table "public"."user_achievements" validate constraint "user_achievements_achievement_id_fkey";

alter table "public"."user_achievements" add constraint "user_achievements_profile_id_achievement_id_key" UNIQUE using index "user_achievements_profile_id_achievement_id_key";

alter table "public"."user_achievements" add constraint "user_achievements_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."user_achievements" validate constraint "user_achievements_profile_id_fkey";

alter table "public"."user_exercises" add constraint "user_exercises_exercise_id_fkey" FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE not valid;

alter table "public"."user_exercises" validate constraint "user_exercises_exercise_id_fkey";

alter table "public"."user_exercises" add constraint "user_exercises_perceived_difficulty_check" CHECK (((perceived_difficulty >= 1) AND (perceived_difficulty <= 10))) not valid;

alter table "public"."user_exercises" validate constraint "user_exercises_perceived_difficulty_check";

alter table "public"."user_exercises" add constraint "user_exercises_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."user_exercises" validate constraint "user_exercises_profile_id_fkey";

alter table "public"."user_exercises" add constraint "user_exercises_reps_check" CHECK ((reps > 0)) not valid;

alter table "public"."user_exercises" validate constraint "user_exercises_reps_check";

alter table "public"."user_exercises" add constraint "user_exercises_sets_check" CHECK ((sets > 0)) not valid;

alter table "public"."user_exercises" validate constraint "user_exercises_sets_check";

grant delete on table "public"."achievements" to "anon";

grant insert on table "public"."achievements" to "anon";

grant references on table "public"."achievements" to "anon";

grant select on table "public"."achievements" to "anon";

grant trigger on table "public"."achievements" to "anon";

grant truncate on table "public"."achievements" to "anon";

grant update on table "public"."achievements" to "anon";

grant delete on table "public"."achievements" to "authenticated";

grant insert on table "public"."achievements" to "authenticated";

grant references on table "public"."achievements" to "authenticated";

grant select on table "public"."achievements" to "authenticated";

grant trigger on table "public"."achievements" to "authenticated";

grant truncate on table "public"."achievements" to "authenticated";

grant update on table "public"."achievements" to "authenticated";

grant delete on table "public"."achievements" to "service_role";

grant insert on table "public"."achievements" to "service_role";

grant references on table "public"."achievements" to "service_role";

grant select on table "public"."achievements" to "service_role";

grant trigger on table "public"."achievements" to "service_role";

grant truncate on table "public"."achievements" to "service_role";

grant update on table "public"."achievements" to "service_role";

grant delete on table "public"."comments" to "anon";

grant insert on table "public"."comments" to "anon";

grant references on table "public"."comments" to "anon";

grant select on table "public"."comments" to "anon";

grant trigger on table "public"."comments" to "anon";

grant truncate on table "public"."comments" to "anon";

grant update on table "public"."comments" to "anon";

grant delete on table "public"."comments" to "authenticated";

grant insert on table "public"."comments" to "authenticated";

grant references on table "public"."comments" to "authenticated";

grant select on table "public"."comments" to "authenticated";

grant trigger on table "public"."comments" to "authenticated";

grant truncate on table "public"."comments" to "authenticated";

grant update on table "public"."comments" to "authenticated";

grant delete on table "public"."comments" to "service_role";

grant insert on table "public"."comments" to "service_role";

grant references on table "public"."comments" to "service_role";

grant select on table "public"."comments" to "service_role";

grant trigger on table "public"."comments" to "service_role";

grant truncate on table "public"."comments" to "service_role";

grant update on table "public"."comments" to "service_role";

grant delete on table "public"."daily_nutrition_logs" to "anon";

grant insert on table "public"."daily_nutrition_logs" to "anon";

grant references on table "public"."daily_nutrition_logs" to "anon";

grant select on table "public"."daily_nutrition_logs" to "anon";

grant trigger on table "public"."daily_nutrition_logs" to "anon";

grant truncate on table "public"."daily_nutrition_logs" to "anon";

grant update on table "public"."daily_nutrition_logs" to "anon";

grant delete on table "public"."daily_nutrition_logs" to "authenticated";

grant insert on table "public"."daily_nutrition_logs" to "authenticated";

grant references on table "public"."daily_nutrition_logs" to "authenticated";

grant select on table "public"."daily_nutrition_logs" to "authenticated";

grant trigger on table "public"."daily_nutrition_logs" to "authenticated";

grant truncate on table "public"."daily_nutrition_logs" to "authenticated";

grant update on table "public"."daily_nutrition_logs" to "authenticated";

grant delete on table "public"."daily_nutrition_logs" to "service_role";

grant insert on table "public"."daily_nutrition_logs" to "service_role";

grant references on table "public"."daily_nutrition_logs" to "service_role";

grant select on table "public"."daily_nutrition_logs" to "service_role";

grant trigger on table "public"."daily_nutrition_logs" to "service_role";

grant truncate on table "public"."daily_nutrition_logs" to "service_role";

grant update on table "public"."daily_nutrition_logs" to "service_role";

grant delete on table "public"."exercises" to "anon";

grant insert on table "public"."exercises" to "anon";

grant references on table "public"."exercises" to "anon";

grant select on table "public"."exercises" to "anon";

grant trigger on table "public"."exercises" to "anon";

grant truncate on table "public"."exercises" to "anon";

grant update on table "public"."exercises" to "anon";

grant delete on table "public"."exercises" to "authenticated";

grant insert on table "public"."exercises" to "authenticated";

grant references on table "public"."exercises" to "authenticated";

grant select on table "public"."exercises" to "authenticated";

grant trigger on table "public"."exercises" to "authenticated";

grant truncate on table "public"."exercises" to "authenticated";

grant update on table "public"."exercises" to "authenticated";

grant delete on table "public"."exercises" to "service_role";

grant insert on table "public"."exercises" to "service_role";

grant references on table "public"."exercises" to "service_role";

grant select on table "public"."exercises" to "service_role";

grant trigger on table "public"."exercises" to "service_role";

grant truncate on table "public"."exercises" to "service_role";

grant update on table "public"."exercises" to "service_role";

grant delete on table "public"."friends" to "anon";

grant insert on table "public"."friends" to "anon";

grant references on table "public"."friends" to "anon";

grant select on table "public"."friends" to "anon";

grant trigger on table "public"."friends" to "anon";

grant truncate on table "public"."friends" to "anon";

grant update on table "public"."friends" to "anon";

grant delete on table "public"."friends" to "authenticated";

grant insert on table "public"."friends" to "authenticated";

grant references on table "public"."friends" to "authenticated";

grant select on table "public"."friends" to "authenticated";

grant trigger on table "public"."friends" to "authenticated";

grant truncate on table "public"."friends" to "authenticated";

grant update on table "public"."friends" to "authenticated";

grant delete on table "public"."friends" to "service_role";

grant insert on table "public"."friends" to "service_role";

grant references on table "public"."friends" to "service_role";

grant select on table "public"."friends" to "service_role";

grant trigger on table "public"."friends" to "service_role";

grant truncate on table "public"."friends" to "service_role";

grant update on table "public"."friends" to "service_role";

grant delete on table "public"."likes" to "anon";

grant insert on table "public"."likes" to "anon";

grant references on table "public"."likes" to "anon";

grant select on table "public"."likes" to "anon";

grant trigger on table "public"."likes" to "anon";

grant truncate on table "public"."likes" to "anon";

grant update on table "public"."likes" to "anon";

grant delete on table "public"."likes" to "authenticated";

grant insert on table "public"."likes" to "authenticated";

grant references on table "public"."likes" to "authenticated";

grant select on table "public"."likes" to "authenticated";

grant trigger on table "public"."likes" to "authenticated";

grant truncate on table "public"."likes" to "authenticated";

grant update on table "public"."likes" to "authenticated";

grant delete on table "public"."likes" to "service_role";

grant insert on table "public"."likes" to "service_role";

grant references on table "public"."likes" to "service_role";

grant select on table "public"."likes" to "service_role";

grant trigger on table "public"."likes" to "service_role";

grant truncate on table "public"."likes" to "service_role";

grant update on table "public"."likes" to "service_role";

grant delete on table "public"."nutrition_plans" to "anon";

grant insert on table "public"."nutrition_plans" to "anon";

grant references on table "public"."nutrition_plans" to "anon";

grant select on table "public"."nutrition_plans" to "anon";

grant trigger on table "public"."nutrition_plans" to "anon";

grant truncate on table "public"."nutrition_plans" to "anon";

grant update on table "public"."nutrition_plans" to "anon";

grant delete on table "public"."nutrition_plans" to "authenticated";

grant insert on table "public"."nutrition_plans" to "authenticated";

grant references on table "public"."nutrition_plans" to "authenticated";

grant select on table "public"."nutrition_plans" to "authenticated";

grant trigger on table "public"."nutrition_plans" to "authenticated";

grant truncate on table "public"."nutrition_plans" to "authenticated";

grant update on table "public"."nutrition_plans" to "authenticated";

grant delete on table "public"."nutrition_plans" to "service_role";

grant insert on table "public"."nutrition_plans" to "service_role";

grant references on table "public"."nutrition_plans" to "service_role";

grant select on table "public"."nutrition_plans" to "service_role";

grant trigger on table "public"."nutrition_plans" to "service_role";

grant truncate on table "public"."nutrition_plans" to "service_role";

grant update on table "public"."nutrition_plans" to "service_role";

grant delete on table "public"."programs" to "anon";

grant insert on table "public"."programs" to "anon";

grant references on table "public"."programs" to "anon";

grant select on table "public"."programs" to "anon";

grant trigger on table "public"."programs" to "anon";

grant truncate on table "public"."programs" to "anon";

grant update on table "public"."programs" to "anon";

grant delete on table "public"."programs" to "authenticated";

grant insert on table "public"."programs" to "authenticated";

grant references on table "public"."programs" to "authenticated";

grant select on table "public"."programs" to "authenticated";

grant trigger on table "public"."programs" to "authenticated";

grant truncate on table "public"."programs" to "authenticated";

grant update on table "public"."programs" to "authenticated";

grant delete on table "public"."programs" to "service_role";

grant insert on table "public"."programs" to "service_role";

grant references on table "public"."programs" to "service_role";

grant select on table "public"."programs" to "service_role";

grant trigger on table "public"."programs" to "service_role";

grant truncate on table "public"."programs" to "service_role";

grant update on table "public"."programs" to "service_role";

grant delete on table "public"."social_posts" to "anon";

grant insert on table "public"."social_posts" to "anon";

grant references on table "public"."social_posts" to "anon";

grant select on table "public"."social_posts" to "anon";

grant trigger on table "public"."social_posts" to "anon";

grant truncate on table "public"."social_posts" to "anon";

grant update on table "public"."social_posts" to "anon";

grant delete on table "public"."social_posts" to "authenticated";

grant insert on table "public"."social_posts" to "authenticated";

grant references on table "public"."social_posts" to "authenticated";

grant select on table "public"."social_posts" to "authenticated";

grant trigger on table "public"."social_posts" to "authenticated";

grant truncate on table "public"."social_posts" to "authenticated";

grant update on table "public"."social_posts" to "authenticated";

grant delete on table "public"."social_posts" to "service_role";

grant insert on table "public"."social_posts" to "service_role";

grant references on table "public"."social_posts" to "service_role";

grant select on table "public"."social_posts" to "service_role";

grant trigger on table "public"."social_posts" to "service_role";

grant truncate on table "public"."social_posts" to "service_role";

grant update on table "public"."social_posts" to "service_role";

grant delete on table "public"."user_achievements" to "anon";

grant insert on table "public"."user_achievements" to "anon";

grant references on table "public"."user_achievements" to "anon";

grant select on table "public"."user_achievements" to "anon";

grant trigger on table "public"."user_achievements" to "anon";

grant truncate on table "public"."user_achievements" to "anon";

grant update on table "public"."user_achievements" to "anon";

grant delete on table "public"."user_achievements" to "authenticated";

grant insert on table "public"."user_achievements" to "authenticated";

grant references on table "public"."user_achievements" to "authenticated";

grant select on table "public"."user_achievements" to "authenticated";

grant trigger on table "public"."user_achievements" to "authenticated";

grant truncate on table "public"."user_achievements" to "authenticated";

grant update on table "public"."user_achievements" to "authenticated";

grant delete on table "public"."user_achievements" to "service_role";

grant insert on table "public"."user_achievements" to "service_role";

grant references on table "public"."user_achievements" to "service_role";

grant select on table "public"."user_achievements" to "service_role";

grant trigger on table "public"."user_achievements" to "service_role";

grant truncate on table "public"."user_achievements" to "service_role";

grant update on table "public"."user_achievements" to "service_role";

grant delete on table "public"."user_exercises" to "anon";

grant insert on table "public"."user_exercises" to "anon";

grant references on table "public"."user_exercises" to "anon";

grant select on table "public"."user_exercises" to "anon";

grant trigger on table "public"."user_exercises" to "anon";

grant truncate on table "public"."user_exercises" to "anon";

grant update on table "public"."user_exercises" to "anon";

grant delete on table "public"."user_exercises" to "authenticated";

grant insert on table "public"."user_exercises" to "authenticated";

grant references on table "public"."user_exercises" to "authenticated";

grant select on table "public"."user_exercises" to "authenticated";

grant trigger on table "public"."user_exercises" to "authenticated";

grant truncate on table "public"."user_exercises" to "authenticated";

grant update on table "public"."user_exercises" to "authenticated";

grant delete on table "public"."user_exercises" to "service_role";

grant insert on table "public"."user_exercises" to "service_role";

grant references on table "public"."user_exercises" to "service_role";

grant select on table "public"."user_exercises" to "service_role";

grant trigger on table "public"."user_exercises" to "service_role";

grant truncate on table "public"."user_exercises" to "service_role";

grant update on table "public"."user_exercises" to "service_role";


