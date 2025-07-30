// app/index.tsx - Página principal de login
import { useState } from 'react';
import { View, Text, TextInput, Button } from 'react-native';
import { router } from 'expo-router';
import { supabase } from '../src/lib/supabase';

console.log('Página principal (index.tsx) cargada como login');

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);

  async function handleSignIn() {
    console.log('Intentando iniciar sesión...');
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) {
      console.error('Error de login:', error.message);
      return setError(error.message);
    }
    console.log('Login exitoso, redirigiendo a home');
    router.replace('/home');  // Redirigir a home después del login
  }

  return (
    <View style={{ flex: 1, justifyContent: 'center', padding: 20, gap: 12 }}>
      <Text style={{ fontSize: 22, fontWeight: '600' }}>Inicia sesión</Text>

      <TextInput
        placeholder="Correo"
        autoCapitalize="none"
        value={email}
        onChangeText={setEmail}
        style={{ borderWidth: 1, padding: 10 }}
      />

      <TextInput
        placeholder="Contraseña"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
        style={{ borderWidth: 1, padding: 10 }}
      />

      {error && <Text style={{ color: 'red' }}>{error}</Text>}

      <Button title="Entrar" onPress={handleSignIn} />
    </View>
  );
}
