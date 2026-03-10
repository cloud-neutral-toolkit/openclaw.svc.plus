import SwiftUI

@MainActor
struct AccountSettings: View {
    @Bindable var state: AppState

    @State private var identifier = ""
    @State private var password = ""
    @State private var statusMessage: String?
    @State private var loginInFlight = false
    @FocusState private var focusedField: Field?

    private enum Field {
        case identifier
        case password
    }

    private var canSignIn: Bool {
        !self.identifier.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !self.password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !self.state.accountServerURL.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 24) {
                self.header

                if self.state.signedInToAccount {
                    self.signedInCard
                } else {
                    self.loginCard
                }

                self.serviceEndpointsCard
            }
            .frame(maxWidth: 640, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.vertical, 22)
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .onAppear {
            if self.identifier.isEmpty, let currentUser = self.state.currentUser {
                self.identifier = currentUser.emailOrAccount
            }
        }
    }
}

extension AccountSettings {
    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color.accentColor.opacity(0.14))
                        .frame(width: 64, height: 64)
                    Image(systemName: self.state.signedInToAccount
                        ? "person.crop.circle.badge.checkmark"
                        : "person.crop.circle")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(Color.accentColor)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(self.state.signedInToAccount ? "Account" : "Account Login")
                        .font(.largeTitle.weight(.semibold))

                    Text(self.headerSubtitle)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            if self.state.authStatus == .offline {
                self.statusPill(
                    title: "Local mode active",
                    tint: Color.accentColor.opacity(0.18),
                    foreground: Color.accentColor)
            }
        }
    }

    private var headerSubtitle: String {
        switch self.state.authStatus {
        case .authenticated:
            "Your account session is available. Local tools remain available alongside remote features."
        case .offline:
            "You are using local mode. Sign in whenever you want sync or remote resources."
        case .unauthenticated:
            "Sign in when you want config sync, remote nodes, and account-backed resources."
        }
    }

    private var loginCard: some View {
        self.settingsCard {
            VStack(alignment: .leading, spacing: 18) {
                self.inputSection(title: "Server URL", systemImage: "server.rack") {
                    TextField(defaultAccountServerURL, text: self.$state.accountServerURL)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .disableAutocorrection(true)
                }

                self.inputSection(title: "Email or account", systemImage: "person.crop.circle") {
                    TextField("name@example.com", text: self.$identifier)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .disableAutocorrection(true)
                        .focused(self.$focusedField, equals: .identifier)
                }

                self.inputSection(title: "Password", systemImage: "lock") {
                    SecureField("Password", text: self.$password)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .focused(self.$focusedField, equals: .password)
                }

                HStack(spacing: 12) {
                    Button(self.loginInFlight ? "Signing In..." : "Sign In") {
                        self.startMockLogin()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!self.canSignIn || self.loginInFlight)

                    Button(self.state.authStatus == .offline ? "Stay in Local Mode" : "Continue Offline") {
                        self.password = ""
                        self.statusMessage = "Local mode stays available. You can sign in later."
                        self.state.continueOfflineMode()
                    }
                    .buttonStyle(.bordered)

                    Spacer(minLength: 0)
                }

                if let statusMessage {
                    Text(statusMessage)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Text("Local tools remain available without an account. Signing in only unlocks remote and synced capabilities.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private var signedInCard: some View {
        self.settingsCard {
            VStack(alignment: .leading, spacing: 18) {
                HStack(alignment: .top, spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.accentColor.opacity(0.16))
                            .frame(width: 58, height: 58)
                        Text(self.state.currentUser?.initials ?? "OC")
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(Color.accentColor)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text(self.state.currentUser?.displayName ?? "OpenClaw Account")
                            .font(.title3.weight(.semibold))

                        if let email = self.state.currentUser?.emailOrAccount {
                            Text(email)
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }

                        self.detailRow(title: "Status", value: self.state.authStatus.statusLabel)
                        self.detailRow(title: "Server", value: self.state.accountServerURL)
                    }

                    Spacer(minLength: 0)
                }

                HStack(spacing: 12) {
                    Button("Sign Out") {
                        self.password = ""
                        self.statusMessage = nil
                        self.state.signOutAccount()
                    }
                    .buttonStyle(.bordered)

                    Button("Switch to Local Mode") {
                        self.password = ""
                        self.statusMessage = "Signed out. Local mode stays available."
                        self.state.signOutAccount(enterOfflineMode: true)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Text("The current build keeps a local placeholder session so the UI flow is ready before API integration.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private var serviceEndpointsCard: some View {
        self.settingsCard {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Service Endpoints")
                        .font(.title3.weight(.semibold))
                    Text("Use custom endpoints for self-hosted, enterprise, or test environments. Keep the optional URLs empty unless you need to override them.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                self.inputSection(title: "Account service URL", systemImage: "server.rack") {
                    TextField(defaultAccountServerURL, text: self.$state.accountServerURL)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .disableAutocorrection(true)
                }

                self.inputSection(title: "Sync service URL", systemImage: "arrow.triangle.2.circlepath") {
                    TextField("Optional", text: self.$state.syncServiceURL)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .disableAutocorrection(true)
                }

                self.inputSection(title: "Node service URL", systemImage: "point.3.connected.trianglepath.dotted") {
                    TextField("Optional", text: self.$state.nodeServiceURL)
                        .textFieldStyle(.plain)
                        .font(.body)
                        .disableAutocorrection(true)
                }
            }
        }
    }

    private func detailRow(title: String, value: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
                .frame(width: 52, alignment: .leading)
            Text(value)
                .font(.callout)
                .textSelection(.enabled)
        }
    }

    private func settingsCard(@ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            content()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(nsColor: .controlBackgroundColor))
                .shadow(color: .black.opacity(0.05), radius: 10, y: 4))
    }

    private func inputSection<Content: View>(
        title: String,
        systemImage: String,
        @ViewBuilder content: () -> Content) -> some View
    {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.callout.weight(.semibold))
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                Image(systemName: systemImage)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .frame(width: 18)
                content()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(nsColor: .windowBackgroundColor))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.primary.opacity(0.08), lineWidth: 1)))
        }
    }

    private func statusPill(title: String, tint: Color, foreground: Color) -> some View {
        Text(title)
            .font(.caption.weight(.semibold))
            .foregroundStyle(foreground)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Capsule().fill(tint))
    }

    private func startMockLogin() {
        guard !self.loginInFlight else { return }
        self.loginInFlight = true
        self.statusMessage = nil

        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 350_000_000)
            self.state.mockSignIn(identifier: self.identifier, password: self.password)
            self.password = ""
            self.loginInFlight = false
            self.statusMessage = "Signed in locally. The API layer can be connected later without changing this flow."
        }
    }
}

#if DEBUG
struct AccountSettings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountSettings(state: .preview)
                .previewDisplayName("Signed Out")

            AccountSettings(state: self.signedInPreview)
                .previewDisplayName("Signed In")
        }
        .frame(width: SettingsTab.windowWidth, height: SettingsTab.windowHeight)
    }

    private static var signedInPreview: AppState {
        let state = AppState.preview
        state.mockSignIn(identifier: "demo@svc.plus", password: "secret")
        state.syncServiceURL = "https://sync.svc.plus"
        state.nodeServiceURL = "https://nodes.svc.plus"
        return state
    }
}
#endif
