import { SpotifyConfig, SpotifySession } from "./ExpoSpotifySDK.types";
import ExpoSpotifySDKModule from "./ExpoSpotifySDKModule";

function isAvailable(): boolean {
  return ExpoSpotifySDKModule.isAvailable();
}

function authenticateAsync(config: SpotifyConfig): Promise<SpotifySession> {
  if (!config.scopes || config.scopes?.length === 0) {
    throw new Error("scopes are required");
  }

  return ExpoSpotifySDKModule.authenticateAsync(config);
}

function connectToRemote(accessToken?: string): Promise<boolean> {
  return ExpoSpotifySDKModule.connectToRemote(accessToken);
}

function disconnectFromRemote(): Promise<boolean> {
  return ExpoSpotifySDKModule.disconnectFromRemote();
}

function playURI(uri: string, accessToken?: string): Promise<boolean> {
  return ExpoSpotifySDKModule.playURI(uri, accessToken);
}

const Remote = {
  connectToRemote,
  disconnectFromRemote,
  playURI,
};

const Authenticate = {
  authenticateAsync,
};

export { isAvailable, Authenticate, Remote };
