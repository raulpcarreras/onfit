// src/lib/supabase.ts
import { createClient } from '@supabase/supabase-js';
import Constants from 'expo-constants';

type ExtraEnv = {
  supabaseUrl: string;
  supabaseAnon: string;
};

// Las variables vienen de app.config.ts ▸ extra ▸ (Constants.expoConfig!.extra)
const { supabaseUrl, supabaseAnon } = (Constants.expoConfig?.extra ?? {}) as ExtraEnv;

console.log('Supabase config:', { supabaseUrl, supabaseAnon: supabaseAnon ? '***SET***' : 'NOT SET' });
console.log('Constants.expoConfig?.extra:', Constants.expoConfig?.extra);

// Validar que las variables existen
if (!supabaseUrl || !supabaseAnon) {
  console.error('Missing Supabase environment variables. Check your .env file and app.config.ts');
  throw new Error('Missing Supabase environment variables. Check your .env file and app.config.ts');
}

// Crea el cliente con tipado completo
export const supabase = createClient(supabaseUrl, supabaseAnon);
