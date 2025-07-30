import { StyleSheet } from 'react-native';

// Definir colores del tema
export const colors = {
  // Colores primarios
  primary: '#007AFF',      // Azul iOS
  primaryDark: '#0051D0',  // Azul más oscuro
  
  // Colores neutros
  white: '#FFFFFF',
  black: '#000000',
  gray: {
    50: '#F9FAFB',
    100: '#F3F4F6',
    200: '#E5E7EB',
    300: '#D1D5DB',
    400: '#9CA3AF',
    500: '#6B7280',
    600: '#4B5563',
    700: '#374151',
    800: '#1F2937',
    900: '#111827',
  },
  
  // Estados
  success: '#10B981',
  error: '#EF4444',
  warning: '#F59E0B',
  info: '#3B82F6',
  
  // Fondo y texto
  background: '#FFFFFF',
  backgroundDark: '#1F2937',
  text: '#1F2937',
  textLight: '#6B7280',
  textDark: '#FFFFFF',
};

// Tamaños comunes
export const spacing = {
  xs: 4,
  sm: 8,
  md: 16,
  lg: 24,
  xl: 32,
  xxl: 48,
};

export const fontSize = {
  xs: 12,
  sm: 14,
  md: 16,
  lg: 18,
  xl: 20,
  xxl: 24,
  xxxl: 32,
};

// Estilos comunes reutilizables
export const commonStyles = StyleSheet.create({
  // Contenedores
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  
  centerContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: spacing.md,
  },
  
  // Texto
  title: {
    fontSize: fontSize.xxl,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: spacing.md,
  },
  
  subtitle: {
    fontSize: fontSize.lg,
    fontWeight: '600',
    color: colors.text,
    marginBottom: spacing.sm,
  },
  
  body: {
    fontSize: fontSize.md,
    color: colors.text,
    lineHeight: 24,
  },
  
  textLight: {
    color: colors.textLight,
  },
  
  // Inputs
  input: {
    borderWidth: 1,
    borderColor: colors.gray[300],
    borderRadius: 8,
    padding: spacing.md,
    fontSize: fontSize.md,
    backgroundColor: colors.white,
    marginBottom: spacing.sm,
  },
  
  inputFocused: {
    borderColor: colors.primary,
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 0 },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 2,
  },
  
  // Botones
  button: {
    backgroundColor: colors.primary,
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.lg,
    borderRadius: 8,
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  
  buttonText: {
    color: colors.white,
    fontSize: fontSize.md,
    fontWeight: '600',
  },
  
  buttonSecondary: {
    backgroundColor: 'transparent',
    borderWidth: 1,
    borderColor: colors.primary,
  },
  
  buttonSecondaryText: {
    color: colors.primary,
  },
  
  // Estados
  errorText: {
    color: colors.error,
    fontSize: fontSize.sm,
    marginBottom: spacing.sm,
  },
  
  successText: {
    color: colors.success,
    fontSize: fontSize.sm,
    marginBottom: spacing.sm,
  },
  
  // Utilidades
  shadow: {
    shadowColor: colors.black,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  
  rounded: {
    borderRadius: 8,
  },
  
  // Flex helpers
  row: {
    flexDirection: 'row',
  },
  
  column: {
    flexDirection: 'column',
  },
  
  center: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  
  spaceBetween: {
    justifyContent: 'space-between',
  },
});

// Exportación por defecto que incluye todo
const theme = {
  colors,
  spacing,
  fontSize,
  // Estilos comunes accesibles directamente
  ...commonStyles,
  // También incluir commonStyles como propiedad separada
  common: commonStyles,
};

export default theme;
