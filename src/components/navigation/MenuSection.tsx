import React, { useEffect } from 'react';
import { Pressable } from 'react-native';
import Animated, { useSharedValue, useAnimatedStyle, withTiming } from 'react-native-reanimated';
import { IconButton } from 'react-native-paper';
import Text from '@/components/Text';
import { useRes } from '@/contexts';
import useMasterdataStyles from "@/styles/common/masterdata";
import { DrawerNavigationHelpers } from '@react-navigation/drawer/lib/typescript/src/types';

interface MenuSectionProps {
    title: string;
    isOpen: boolean;
    onToggle: () => void;
    items: { label: string; navigateTo: string }[];
    navigation: DrawerNavigationHelpers;
}

const MenuSection = React.memo(({ title, isOpen, onToggle, items, navigation }: MenuSectionProps) => {
    const { fontSize, spacing } = useRes();
    const itemHeight = fontSize === "small" ? 50 : fontSize === "medium" ? 60 : 75;
    const height = useSharedValue(0);
    const opacity = useSharedValue(0);
    const totalHeight = items.length * itemHeight;
    const masterdataStyles = useMasterdataStyles();

    const animatedStyle = useAnimatedStyle(() => ({
        height: height.value,
        opacity: opacity.value,
        overflow: 'hidden',
    }), [height, opacity]);

    useEffect(() => {
        if (isOpen) {
            opacity.value = withTiming(1, { duration: 300 });
            height.value = withTiming(totalHeight, { duration: 300 });
        } else {
            setTimeout(() => {
                opacity.value = withTiming(0, { duration: 300 });
                height.value = withTiming(0, { duration: 300 });
            }, 300);
        }
    }, [isOpen, totalHeight]);

    return (
        <>
            <Pressable onPress={onToggle} style={masterdataStyles.menuItemNav}>
                <Text style={masterdataStyles.menuText}>{title ?? ""}</Text>
                <IconButton icon={isOpen ? 'chevron-up' : 'chevron-down'} size={spacing.large} />
            </Pressable>
            <Animated.View style={animatedStyle}>
                {items.map((item) => (
                    <Pressable key={item.label} onPress={() => navigation.navigate(item.navigateTo)} style={masterdataStyles.subMenuItem}>
                        <Text style={masterdataStyles.subMenuText}>{item.label ?? ""}</Text>
                    </Pressable>
                ))}
            </Animated.View>
        </>
    );
}, (prevProps, nextProps) => {
    return prevProps.isOpen === nextProps.isOpen && prevProps.items === nextProps.items;
});

export default MenuSection;
