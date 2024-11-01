import "../global.css";

import * as SplashScreen from 'expo-splash-screen';
import * as Font from "expo-font";
import { useEffect, useState } from "react";
import { ActivityIndicator } from "react-native";
import { ThemeProvider } from "@/provider/theme";
import { ResponsiveProvider } from "@/provider/responsive";
import { Provider as PaperProvider } from 'react-native-paper';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import { Drawer } from 'expo-router/drawer';
import { useTheme } from "@/contexts";

const SetTheme = () => {
  const { theme } = useTheme();

  return (
    <PaperProvider theme={theme}>
      <GestureHandlerRootView style={{ flex: 1 }}>
        <Drawer>
          <Drawer.Screen
            name="index"
            options={{
              drawerLabel: 'Home',
              title: 'Home',
            }}
          />
          <Drawer.Screen
            name="settings/SettingScreen"
            options={{
              drawerLabel: 'Settings',
              title: 'Settings',
            }}
          />
        </Drawer>
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
        <SetTheme />
      </ResponsiveProvider>
    </ThemeProvider>
  );
}
