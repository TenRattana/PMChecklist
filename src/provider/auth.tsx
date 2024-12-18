import { saveUserData, loadUserData } from '@/services/storage';
import React, { createContext, useContext, useState, useEffect, ReactNode, useCallback, useMemo } from "react";
import axiosInstance from '@/configs/axios';
import { GroupUsers, UsersPermission } from '@/types/type';
import { useQuery } from 'react-query';

const fetchUserPermission = async (): Promise<UsersPermission[]> => {
  const response = await axiosInstance.post('User_service.asmx/GetUsersPermission');
  return response.data.data ?? [];
};

const fetchGroupUser = async (): Promise<GroupUsers[]> => {
  const response = await axiosInstance.post('GroupUser_service.asmx/GetGroupUsers');
  return response.data.data ?? [];
};

export interface AuthContextProps {
  session: { UserID: string, UserName: string, GUserID: string, GUserName: string, IsActive: boolean };
  loading: boolean;
  screens: { name: string }[];
  login: (username: string) => void;
}

export const AuthContext = createContext<AuthContextProps | undefined>(undefined);

interface AuthProviderProps {
  children: ReactNode;
}

export const AuthProvider: React.FC<AuthProviderProps> = ({ children }) => {
  console.log("AuthProvider");
  const [session, setSession] = useState<{ UserID: string, UserName: string, GUserID: string, GUserName: string, IsActive: boolean }>({ UserID: "", UserName: "", GUserID: "", GUserName: "", IsActive: false });
  const [loading, setLoading] = useState<boolean>(true);
  const [screens, setScreens] = useState<{ name: string }[]>([{ name: "Permission_deny" }]);

  const { data: user = [] } = useQuery<UsersPermission[], Error>(
    'userPermission',
    fetchUserPermission,
    {
      refetchOnWindowFocus: false,
      keepPreviousData: true,
    }
  );

  const { data: groupUser = [] } = useQuery<GroupUsers[], Error>(
    'groupUser',
    fetchGroupUser,
    {
      refetchOnWindowFocus: false,
      keepPreviousData: true,
      staleTime: 1000 * 60 * 5,
      cacheTime: 1000 * 60 * 10
    });

  const updateSession = useCallback((UserName: string) => {
    const userData = user.find(v => v.UserName === UserName);
    if (userData) {
      const newSession = {
        UserID: userData.UserID,
        UserName: userData.UserName,
        GUserID: userData.GUserID,
        GUserName: groupUser.find(v => v.GUserID === userData.GUserID)?.GUserName || "",
        IsActive: userData.IsActive
      };
      saveUserData(userData)
      setSession(newSession);
    }
    setLoading(false)
  }, [user, groupUser, setSession]);

  useEffect(() => {
    loadUserData().then(userInfo => {
      if (userInfo) {
        updateSession(userInfo.UserName);
      }
    });
  }, [loadUserData, updateSession]);

  const login = useCallback((username: string) => {
    updateSession(username);
  }, [user, groupUser]);

  useEffect(() => {
    if (session.UserName) {
      const screenMapping: Record<string, string[]> = {
        SuperAdmin: ["Home", "Machine_group", "Machine", "Checklist", "Checklist_option", "Checklist_group", "Match_checklist_option", "Match_form_machine", "Create_form", "Expected_result", "Form", "User", "Preview", "Admin", "ScanQR", "GenerateQR", "InputFormMachine", "Setting", "Managepermissions", "SuperAdmin", "Permission_deny", "Config"],
        Admin: ["Home", "Machine_group", "Machine", "Checklist", "Checklist_option", "Checklist_group", "Match_checklist_option", "Match_form_machine", "Create_form", "Expected_result", "Form", "User", "Preview", "Admin", "ScanQR", "GenerateQR", "InputFormMachine", "Setting", "Permission_deny", "Config"],
        GeneralUser: ["Home", "ScanQR", "InputFormMachine", "Setting", "Permission_deny"]
      };

      setScreens(screenMapping[session.GUserName] ? screenMapping[session.GUserName].map((name) => ({ name })) : [{ name: "Permission_deny" }]);
    }
  }, [session]);

  const value = useMemo(() => ({ session, loading, screens, login }), [session, loading, screens, login]);

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};
