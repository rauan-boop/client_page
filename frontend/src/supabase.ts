import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase =
  supabaseUrl && supabaseAnonKey
    ? createClient(supabaseUrl, supabaseAnonKey)
    : null

export const supabaseConfigError = supabase
  ? null
  : 'Не настроено подключение к базе данных. Проверьте переменные VITE_SUPABASE_URL и VITE_SUPABASE_ANON_KEY.'
