import React from "react";
import { Picker } from "@react-native-picker/picker";
import { HelperText } from "react-native-paper";
import { SelectsProps } from "@/types/tag";
import AccessibleView from "@/components/AccessibleView";
import useMasterdataStyles from "@/styles/common/masterdata";
import Text from "@/components/Text";
import { View } from "react-native";
import { useTheme } from "@/contexts";

const Selects: React.FC<SelectsProps> = React.memo(({
  hint,
  option,
  value,
  handleChange,
  handleBlur,
  label,
  error,
  errorMessage,
  testId
}) => {
  if (!option || option.length === 0) {
    return null;
  }
  console.log("Selects");
  const masterdataStyles = useMasterdataStyles()
  const { theme } = useTheme();

  return (
    <View id="selects" style={masterdataStyles.commonContainer}>
      {label ? <Text style={masterdataStyles.label}>{label}</Text> : false}
      <AccessibleView name="group-selects" style={masterdataStyles.dropdownContainer}>
        <Picker
          selectedValue={value}
          onValueChange={handleChange}
          onBlur={handleBlur}
          style={masterdataStyles.picker}
          itemStyle={masterdataStyles.text}
          testID={testId}
          id={testId}
        >
          <Picker.Item label="Select..."
            value=""
          />
          {option.map((item, index) => (
            <Picker.Item
              key={`value-${index}`}
              label={item.label}
              value={item.value}
            />
          ))}
        </Picker>
      </AccessibleView>
      {hint ? <Text style={masterdataStyles.hint}>{hint}</Text> : false}
      <HelperText type="error" visible={error} style={[{ display: error ? 'flex' : 'none' }, masterdataStyles.errorText]}>
        {errorMessage}
      </HelperText>
    </View>
  );
});

export default Selects;
