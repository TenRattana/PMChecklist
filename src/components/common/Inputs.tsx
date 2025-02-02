import React, { useMemo } from "react";
import { TextInput, HelperText } from "react-native-paper";
import { StyleSheet, View } from "react-native";
import AccessibleView from "@/components/AccessibleView";
import { InputProps } from "@/types/tag";
import useMasterdataStyles from "@/styles/common/masterdata";
import Text from "@/components/Text";
import { useRes, useTheme } from "@/contexts";

const Inputs: React.FC<InputProps> = React.memo(({
  placeholder,
  label,
  error,
  errorMessage,
  value,
  handleChange,
  handleBlur,
  hint,
  mode,
  testId,
  textColor
}) => {
  const masterdataStyles = useMasterdataStyles();

  const formattedLabel = useMemo(() => {
    return mode ? undefined : <Text style={masterdataStyles.text}>{label}</Text>;
  }, [label, mode]);

  const { spacing } = useRes()
  const { theme } = useTheme()
  return (
    <View
      id="inputs"
      style={masterdataStyles.commonContainer}
    >
      <TextInput
        mode={mode || "outlined"}
        placeholder={placeholder}
        label={formattedLabel}
        textColor={textColor ? textColor : theme.colors.onBackground}
        style={{ fontSize: spacing.small }}
        onChangeText={handleChange}
        onBlur={handleBlur}
        value={String(value)}
        right={
          value ? (
            <TextInput.Icon
              icon="window-close"
              onPress={() => handleChange("")}
            />
          ) : undefined
        }
        error={error}
        enterKeyHint="done"
        testID={testId}
        id={testId}
      />
      {hint ? <Text style={masterdataStyles.hint}>{hint}</Text> : false}
      <HelperText type="error" visible={error} style={[{ display: error ? 'flex' : 'none' }, masterdataStyles.errorText]}>
        {errorMessage}
      </HelperText>
    </View>
  );
});

export default Inputs;
