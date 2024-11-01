// import { configureStore } from "@reduxjs/toolkit";
// import counterForm from "@/slices/forms/counterForm";
// import counterPrefix from '@/slices/prefix/counterPrefix';
// import { persistStore, persistReducer } from 'redux-persist';
// import storage from 'redux-persist/lib/storage';
// import AsyncStorage from '@react-native-async-storage/async-storage';
// import { Platform } from 'react-native';

// const storages = AsyncStorage;

// const formPersistConfig = {
//   key: 'form',
//   storage: storages,
// };

// const prefixPersistConfig = {
//   key: 'prefix',
//   storage: storages,
// };

// const formReducer = persistReducer(formPersistConfig, counterForm);
// const prefixReducer = persistReducer(prefixPersistConfig, counterPrefix);

// const store = configureStore({
//   reducer: {
//     form: formReducer,
//     prefix: prefixReducer,
//   },
//   middleware: (getDefaultMiddleware) =>
//     getDefaultMiddleware({
//       serializableCheck: {
//         ignoredActions: ['persist/PERSIST', 'persist/REHYDRATE'],
//       },
//     }),
// });

// const persistor = persistStore(store);

// export { store, persistor };
