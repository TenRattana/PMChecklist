import { create } from 'zustand';

export type State = {
    AppName: string;
    GroupMachine: string;
    Machine: string;
    CheckList: string;
    GroupCheckList: string;
    CheckListOption: string;
    MatchCheckListOption: string;
    MatchFormMachine: string;
    Form: string;
    ExpectedResult: string;
    UsersPermission: string;
}

export type Action = {
    setAppName: (text: State['AppName']) => void;
    setPrefixGroupMachine: (text: State['GroupMachine']) => void;
    setPrefixMachine: (text: State['Machine']) => void;
    setPrefixCheckList: (text: State['CheckList']) => void;
    setPrefixGroupCheckList: (text: State['GroupCheckList']) => void;
    setPrefixCheckListOption: (text: State['CheckListOption']) => void;
    setPrefixMatchCheckListOption: (text: State['MatchCheckListOption']) => void;
    setPrefixMatchFormMachine: (text: State['MatchFormMachine']) => void;
    setPrefixForm: (text: State['Form']) => void;
    setPrefixExpectedResult: (text: State['ExpectedResult']) => void;
    setPrefixUsersPermission: (text: State['UsersPermission']) => void;
}

const initialState: State = {
    AppName: "Default Name",
    GroupMachine: "GM",
    Machine: "M",
    CheckList: "CL",
    GroupCheckList: "GCL",
    CheckListOption: "CLO",
    MatchCheckListOption: "MCLO",
    MatchFormMachine: "MFM",
    Form: "F",
    ExpectedResult: "ER",
    UsersPermission: "U",
};

export const useStore = create<State & Action>((set) => ({
    ...initialState,
    setAppName: (text) => set({ AppName: text }),
    setPrefixGroupMachine: (text) => set({ GroupMachine: text }),
    setPrefixMachine: (text) => set({ Machine: text }),
    setPrefixCheckList: (text) => set({ CheckList: text }),
    setPrefixGroupCheckList: (text) => set({ GroupCheckList: text }),
    setPrefixCheckListOption: (text) => set({ CheckListOption: text }),
    setPrefixMatchCheckListOption: (text) => set({ MatchCheckListOption: text }),
    setPrefixMatchFormMachine: (text) => set({ MatchFormMachine: text }),
    setPrefixForm: (text) => set({ Form: text }),
    setPrefixExpectedResult: (text) => set({ ExpectedResult: text }),
    setPrefixUsersPermission: (text) => set({ UsersPermission: text }),
}));

export const useReset = () => {
    useStore.setState(initialState);
};
