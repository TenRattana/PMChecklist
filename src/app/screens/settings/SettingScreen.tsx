import React, { useEffect, useMemo } from 'react';
import { Switch } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { Picker } from '@react-native-picker/picker';
import { AccessibleView, Text } from '@/components';
import useMasterdataStyles from '@/styles/common/masterdata';
import { useRes, useTheme } from '@/contexts';

const SettingsScreen: React.FC = () => {
  const { spacing, fontSize, setFontSize, } = useRes();
  const { darkMode, setDarkMode, theme } = useTheme();

  const masterdataStyles = useMasterdataStyles()

  useEffect(() => {
    const loadSettings = async () => {
      const savedDarkMode = await AsyncStorage.getItem('darkMode');
      const savedFontSize = await AsyncStorage.getItem('fontSize');

      if (savedDarkMode !== null) setDarkMode(savedDarkMode === 'darkMode');
      if (savedFontSize) setFontSize(savedFontSize);
    };

    loadSettings();
  }, []);

  const toggleSwitch = async () => {
    const newDarkMode = !darkMode;
    setDarkMode(newDarkMode);
    await AsyncStorage.setItem('darkMode', String(newDarkMode ? 'darkMode' : ''));
  };

  const handleFontSizeChange = async (size: string) => {
    setFontSize(size);
    await AsyncStorage.setItem('fontSize', size);
  };

  const MySwitch = useMemo(() => {
    return (
      <AccessibleView name="container-switch" style={{ alignSelf: 'center', alignItems: 'center' }}>
        <Switch
          onValueChange={toggleSwitch}
          value={darkMode}
          thumbColor={darkMode ? "#fff" : "#000"}
          trackColor={{ false: theme.colors.onBackground, true: theme.colors.onBackground }}
          style={{ transform: [{ scale: 1.5 }] }}
        />
      </AccessibleView>
    );
  }, [toggleSwitch, darkMode]);
  console.log(spacing);

  return (
    <AccessibleView name="setting" style={[masterdataStyles.container]}>
      <Text style={[masterdataStyles.textBold, masterdataStyles.text, { textAlign: 'center', paddingVertical: 30, fontSize: spacing.large }]}>Settings</Text>

      <AccessibleView name="setting-mode" style={[masterdataStyles.settingItem]}>
        <Text style={[masterdataStyles.settingText]}>Dark Mode</Text>
        {MySwitch}
      </AccessibleView>

      <AccessibleView name="setting-font" style={[masterdataStyles.settingItem]}>
        <Text style={[masterdataStyles.settingText]}>Font Size</Text>
        <AccessibleView name="Picker" style={[masterdataStyles.pickerContainer]}>
          <Picker
            selectedValue={fontSize}
            style={[masterdataStyles.picker]}
            onValueChange={handleFontSizeChange}
            id='picker-font'
          >
            <Picker.Item label="Small" value="small" />
            <Picker.Item label="Medium" value="medium" />
            <Picker.Item label="Large" value="large" />
          </Picker>
        </AccessibleView>
      </AccessibleView>
    </AccessibleView>
  );
};

export default SettingsScreen;
