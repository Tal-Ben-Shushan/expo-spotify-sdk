import Foundation
import SpotifyiOS

extension ExpoSpotifySessionManager: SPTSessionManagerDelegate {
    public func sessionManager(manager _: SPTSessionManager, didInitiate session: SPTSession) {
        currentSession = session
        appRemote.connectionParameters.accessToken = session.accessToken
        authPromiseSeal?.fulfill(session)
    }
    
    public func sessionManager(manager _: SPTSessionManager, didFailWith error: Error) {
        authPromiseSeal?.reject(error)
    }
    
    public func sessionManager(manager _: SPTSessionManager, didRenew session: SPTSession) {
        currentSession = session
        appRemote.connectionParameters.accessToken = session.accessToken
        authPromiseSeal?.fulfill(session)
    }
}

extension ExpoSpotifySessionManager: SPTAppRemoteDelegate {
    public func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        NSLog("Established connection to Spotify App Remote")
    }

    public func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        NSLog("Failed connection attempt to Spotify App Remote")
    }

    public func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        NSLog("Disconnected from Spotify App Remote")
    }
}
