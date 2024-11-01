import React, { useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { Formik } from 'formik';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';
import { IconButton } from 'react-native-paper';
import { useRes, useTheme } from '@/contexts';
import { Inputs, Text } from '@/components';
import useMasterdataStyles from '@/styles/common/masterdata';
import { useStore, State, Action } from "@/stores/Prefix";

interface ConfigItemProps {
    label: string;
    value: string;
    editable: boolean;
    onEdit: (v: boolean) => void;
}

const RenderFormik: React.FC<{ field: keyof State; setEdit: (v: boolean) => void }> = React.memo(({ field, setEdit }) => {
    const state = useStore();
    const actions: Action = useStore();

    const { spacing } = useRes();
    const { theme } = useTheme();

    return (
        <Formik
            initialValues={{ [field]: state[field] }}
            validateOnBlur={true}
            validateOnChange={false}
            onSubmit={(values) => {
                const value = String(values[field]);
                switch (field) {
                    case 'AppName': actions.setAppName(value); break;
                    case 'GroupMachine': actions.setPrefixGroupMachine(value); break;
                    case 'CheckList': actions.setPrefixCheckList(value); break;
                    case 'CheckListOption': actions.setPrefixCheckListOption(value); break;
                    case 'ExpectedResult': actions.setPrefixExpectedResult(value); break;
                    case 'Form': actions.setPrefixForm(value); break;
                    case 'GroupCheckList': actions.setPrefixGroupCheckList(value); break;
                    case 'Machine': actions.setPrefixMachine(value); break;
                    case 'MatchCheckListOption': actions.setPrefixMatchCheckListOption(value); break;
                    case 'MatchFormMachine': actions.setPrefixMatchFormMachine(value); break;
                    case 'UsersPermission': actions.setPrefixUsersPermission(value); break;
                    default: break;
                }
                setEdit(false);
            }}
        >
            {({ handleSubmit, errors, touched, setFieldValue, setTouched, values }) => (
                <Animated.View entering={FadeIn} exiting={FadeOut} style={styles.formContainer}>
                    <View style={[{ width: 500 }]}>
                        <Inputs
                            placeholder={`Enter ${field}`}
                            label={field}
                            handleChange={(value) => setFieldValue(field, value)}
                            handleBlur={() => setTouched({ ...touched, [field]: true })}
                            value={String(values[field] ?? "")}
                            error={touched[field] && Boolean(errors[field])}
                            errorMessage={String(errors[field])}
                            testId={`${field}-cf`}
                        />
                    </View>

                    <IconButton
                        icon="check"
                        onPress={() => handleSubmit()}
                        iconColor={theme.colors.green}
                        size={spacing.large}
                        style={styles.iconButton}
                    />
                </Animated.View>
            )}
        </Formik>
    );
});

const ConfigItem: React.FC<ConfigItemProps> = ({ label, value, editable, onEdit }) => {
    const { theme } = useTheme();
    const { spacing } = useRes();
    const masterdataStyles = useMasterdataStyles();

    return (
        <View style={styles.container}>
            <Text style={[styles.configPrefixText, masterdataStyles.settingText]}>{`${label} : ${!editable ? value : ""}`}</Text>
            {editable ? <RenderFormik field={label === "Program Name" ? "AppName" : (label as keyof State)} setEdit={onEdit} />
                : <IconButton icon="pencil-box" onPress={() => onEdit(true)} iconColor={theme.colors.blue} size={spacing.large + 5} />}
        </View>
    );
};

const ConfigurationScreen: React.FC = React.memo(() => {
    const state = useStore();

    const [edit, setEdit] = useState<{ [key: string]: boolean }>({
        AppName: false,
        GroupMachine: false,
        Machine: false,
        CheckList: false,
        GroupCheckList: false,
        CheckListOption: false,
        MatchCheckListOption: false,
        MatchFormMachine: false,
        Form: false,
        ExpectedResult: false,
        UsersPermission: false
    });

    const keys: (keyof State)[] = [
        'GroupMachine',
        'Machine',
        'CheckList',
        'GroupCheckList',
        'CheckListOption',
        'MatchCheckListOption',
        'MatchFormMachine',
        'Form',
        'ExpectedResult',
        'UsersPermission',
    ];

    const masterdataStyles = useMasterdataStyles();
    const { spacing } = useRes();

    return (
        <ScrollView id="setting" style={masterdataStyles.container}>
            <Text style={[masterdataStyles.textBold, masterdataStyles.text, { textAlign: 'center', paddingVertical: 30, fontSize: spacing.large }]}>
                Configuration
            </Text>

            <View id="config-app" style={masterdataStyles.configPrefix}>
                <Text style={[masterdataStyles.settingText, masterdataStyles.textBold]}>Program Display</Text>
                <ConfigItem
                    label="Program Name"
                    value={state.AppName}
                    editable={edit.AppName}
                    onEdit={(v) => setEdit(prev => ({ ...prev, AppName: v }))}
                />
            </View>

            <View id="config-prefix" style={masterdataStyles.configPrefix}>
                <Text style={[masterdataStyles.settingText, masterdataStyles.textBold]}>Fix Prefixes</Text>
                {keys.map((item) => (
                    <ConfigItem
                        key={item}
                        label={item}
                        value={state[item]}
                        editable={edit[item]}
                        onEdit={(v: boolean) => setEdit(prev => ({ ...prev, [item]: v }))}
                    />
                ))}
            </View>
        </ScrollView>
    );
});

export default ConfigurationScreen;

const styles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'row',
        flexBasis: '100%',
        alignItems: 'center',
        justifyContent: 'space-between',
        marginVertical: 10,
        paddingVertical: 12,
        paddingHorizontal: 15,
    },
    configPrefixText: {
        marginRight: 10,
        fontWeight: '600',
        fontSize: 16,
        color: '#333',
    },
    formContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        flex: 1,
        paddingHorizontal: 5,
    },
    iconButton: {
        padding: 0,
        margin: 0
    },
});
