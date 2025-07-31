-- 1. Extensiones útiles
create extension if not exists "pgcrypto";
create extension if not exists "pgjwt";

-- 2. Tabla de perfiles (datos extra del usuario)
create table if not exists public.profiles (
  id uuid primary key references auth.users on delete cascade,
  display_name text,
  avatar_url text,
  created_at timestamptz default now()
);

-- 3. Cursos y módulos
create table if not exists public.courses (
  id serial primary key,
  title text not null,
  description text,
  price_cents integer not null default 0,
  created_at timestamptz default now()
);

create table if not exists public.modules (
  id serial primary key,
  course_id integer references public.courses on delete cascade,
  title text,
  video_url text,
  position integer,
  created_at timestamptz default now()
);

-- 4. Progreso del usuario
create table if not exists public.progress (
  user_id uuid references public.profiles on delete cascade,
  module_id integer references public.modules on delete cascade,
  completed boolean default false,
  updated_at timestamptz default now(),
  primary key (user_id, module_id)
);

-- 5. Pagos (Stripe)
create table if not exists public.payments (
  id serial primary key,
  user_id uuid references public.profiles on delete cascade,
  stripe_session_id text unique,
  plan text,
  amount_cents integer,
  status text,
  created_at timestamptz default now()
);

-- 6. Activar Row-Level Security (RLS)
alter table public.profiles  enable row level security;
alter table public.progress  enable row level security;
alter table public.payments  enable row level security;

-- 6a. Política: cada usuario sólo ve/edita su propio perfil
drop policy if exists "Own profile" on public.profiles;
create policy "Own profile" on public.profiles
  for all using (auth.uid() = id);

-- 6b. Política: cada usuario sólo ve/edita su progreso
drop policy if exists "Own progress" on public.progress;
create policy "Own progress" on public.progress
  for all using (auth.uid() = user_id);

-- 6c. Política: cada usuario sólo ve/edita sus pagos
drop policy if exists "Own payments" on public.payments;
create policy "Own payments" on public.payments
  for all using (auth.uid() = user_id);
