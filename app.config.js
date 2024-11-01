import "dotenv/config";

const getEnvVars = (env = "") => {
  switch (env) {
    case "production":
      return {
        apiUrl: process.env.API_URL,
        environment: "production",
      };
    case "development":
    default:
      return {
        apiUrl: process.env.API_URL,
        environment: "development",
      };
  }
};

const environment = process.env.APP_ENV || "development";

export default {
  expo: {
    scheme: "acme",
    version: "1.0.0",
    userInterfaceStyle: "automatic",
    orientation: "landscape",
    orientation: "default",
    web: {
      output: "static",
      bundler: "metro",
    },
    plugins: [
      [
        "expo-router",
        {
          origin: "https://n",
        },
      ],
      "expo-font",
    ],
    name: "PMChecklist",
    slug: "PMChecklist",
  },
  extra: getEnvVars(environment),
  experiments: {
    typedRoutes: true,
  },
};
