import { ResponsiveContext, ResponsiveContextType } from "@/provider/responsive";
import { ThemeContext, ThemeContextProps } from "@/provider/theme";
import { useContext } from "react";

export const useRes = (): ResponsiveContextType => {
    const context = useContext(ResponsiveContext);
    if (context === undefined) {
        throw new Error("useRes must be used within a ResponsiveProvider");
    }
    return context;
};

export const useTheme = (): ThemeContextProps => {
    const context = useContext(ThemeContext);
    if (!context) {
        throw new Error('useTheme must be used within a ThemeProvider');
    }
    return context;
};