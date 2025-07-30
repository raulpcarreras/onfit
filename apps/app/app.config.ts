import 'dotenv/config';
import { ExpoConfig } from '@expo/config-types';

const config: ExpoConfig = {
  name: 'onfit',
  slug: 'onfit',
  version: '1.0.0',
  scheme: 'onfit',
  platforms: ['ios', 'android', 'web'],
  extra: {
    supabaseUrl: process.env.SUPABASE_URL,
    supabaseAnon: process.env.SUPABASE_ANON_KEY,
  },
  plugins: [
    'expo-router',
    [
      'expo-splash-screen',
      {
        image: './assets/splash.png',
        imageWidth: 200,
        resizeMode: 'contain',
        backgroundColor: '#ffffff'
      }
    ]
  ],
  ios: {
    bundleIdentifier: 'com.onfit.app',
  },
  android: {
    package: 'com.onfit.app',
  },
  web: {
    bundler: 'metro'
  }
};

export default config;
