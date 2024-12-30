import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { AuthClient } from "@dfinity/auth-client";
import "./main.css";

const init = async () => {
  const authClient = await AuthClient.create();

  if (authClient.isAuthenticated()) {
    handleAuthenticated(authClient);
  } else {
    await authClient.login({
      identityProvider: "https://identity.ic0.app/#authorize",
      onSuccess: () => {
        handleAuthenticated(authClient);
      },
    });
  }
};

async function handleAuthenticated(authClient) {
  ReactDOM.createRoot(document.getElementById("root")).render(
    <React.StrictMode>
      <App />
    </React.StrictMode>
  );
}

init();
