// app/index.tsx - Página principal de login
import { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, ActivityIndicator } from 'react-native';
import { useAuth } from '../src/context/AuthContext';

console.log('Página principal (index.tsx) cargada como login');

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  const { signInWithPassword, signInWithGoogle } = useAuth();

  async function handleSignIn() {
    setLoading(true);
    setError(null);
    console.log('Intentando iniciar sesión...');
    const { error } = await signInWithPassword(email, password);
    if (error) {
      console.error('Error de login:', error.message);
      setError(error.message);
    }
    setLoading(false);
  }

  async function handleGoogleSignIn() {
    setLoading(true);
    setError(null);
    console.log('Intentando iniciar sesión con Google...');
    const { error } = await signInWithGoogle();
    if (error) {
      console.error('Error de login con Google:', error.message);
      setError(error.message);
    }
    setLoading(false);
  }

  return (
    <View className="flex-1 items-center justify-center bg-gray-50 p-6">
      {/* Placeholder para el logo */}
      <View className="w-32 h-32 bg-gray-200 rounded-full mb-8 items-center justify-center">
        <Text className="text-gray-600 text-xl font-bold">Logo</Text>
      </View>

      <Text className="text-4xl font-extrabold text-gray-900 mb-8 text-center">Inicia sesión</Text>

      <TextInput
        placeholder="Correo electrónico"
        autoCapitalize="none"
        value={email}
        onChangeText={setEmail}
        className="w-full border border-gray-300 p-4 rounded-xl text-lg mb-4 bg-white"
        keyboardType="email-address"
      />

      <TextInput
        placeholder="Contraseña"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
        className="w-full border border-gray-300 p-4 rounded-xl text-lg mb-6 bg-white"
      />

      {error && <Text className="text-red-600 text-base mb-4 text-center">{error}</Text>}

      <View className="w-full">
        <TouchableOpacity
          className={`py-4 rounded-xl mb-4 items-center ${
            loading ? 'bg-blue-400' : 'bg-blue-600'
          }`}
          onPress={handleSignIn}
          disabled={loading}
        >
          <Text className="text-white text-xl font-bold">
            {loading ? "Cargando..." : "Entrar"}
          </Text>
        </TouchableOpacity>

        <TouchableOpacity
          className="bg-red-600 py-4 rounded-xl items-center"
          onPress={handleGoogleSignIn}
          disabled={loading}
        >
          <Text className="text-white text-xl font-bold">
            Iniciar sesión con Google
          </Text>
        </TouchableOpacity>
      </View>

      {loading && <ActivityIndicator size="large" color="#2563EB" className="mt-6" />}
    </View>
  );
}
