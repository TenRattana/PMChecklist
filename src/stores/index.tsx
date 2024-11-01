import { configureStore } from "@reduxjs/toolkit";
import counterForm from "@/slices/forms/counterForm";

const store = configureStore({
  reducer: {
    form: counterForm,
  },
});

export { store };
