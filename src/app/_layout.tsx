import "../global.css";

import * as SplashScreen from 'expo-splash-screen';
import * as Font from "expo-font";
import { useEffect, useState } from "react";
import { ActivityIndicator } from "react-native";
import { ThemeProvider } from "@/provider/theme";
import { ResponsiveProvider } from "@/provider/responsive";
import { AuthProvider } from "@/provider/auth";
import { Provider as PaperProvider } from 'react-native-paper';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import { useTheme, useAuth } from "@/contexts";
import { store } from "@/stores";
import { Provider } from "react-redux";
import { QueryClient, QueryClientProvider } from 'react-query';
import { ToastProvider } from "@/provider/toastify";
import Navigation from "./nav/Navigation";

const queryClient = new QueryClient();
SplashScreen.preventAutoHideAsync();

const SetTheme = () => {
  const { theme } = useTheme();
  const { screens, loading } = useAuth();

  console.log(screens);

  if (!loading) {
    return <ActivityIndicator size="large" color="#0000ff" />;
  }

  return (
    <PaperProvider theme={theme}>
      <GestureHandlerRootView style={{ flex: 1 }}>
        <Navigation />
      </GestureHandlerRootView>
    </PaperProvider>
  );
}

export default function Layout() {
  const [fontsLoaded, setFontsLoaded] = useState(false);

  useEffect(() => {
    const prepare = async () => {
      try {
        await Font.loadAsync({
          "Poppins": require("../assets/fonts/Poppins-Regular.ttf"),
          "Sarabun": require("../assets/fonts/Sarabun-Regular.ttf"),
        });
        await new Promise(resolve => setTimeout(resolve, 2000));
      } catch (error) {
        console.warn('Error loading fonts:', error);
      } finally {
        setFontsLoaded(true);
      }
    };

    prepare();
  }, []);

  useEffect(() => {
    if (fontsLoaded) {
      SplashScreen.hideAsync();
    }
  }, [fontsLoaded]);

  if (!fontsLoaded) {
    return <ActivityIndicator size="large" color="#0000ff" />;
  }

  return (
    <ThemeProvider>
      <ResponsiveProvider>
        <ToastProvider>
          <QueryClientProvider client={queryClient}>
            <AuthProvider>
              <Provider store={store}>
                <SetTheme />
              </Provider>
            </AuthProvider>
          </QueryClientProvider>
        </ToastProvider>
      </ResponsiveProvider>
    </ThemeProvider>
  );
}
