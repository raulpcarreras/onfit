-- Añadir índices para mejorar el rendimiento de las consultas

create index on public.modules (course_id);
create index on public.payments (user_id);
