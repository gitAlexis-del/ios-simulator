import JavaScriptKit
import TokamakDOM

// ---------- Icône d'app ----------
struct AppIcon: View {
  let name: String
  var showLabel = true

  var body: some View {
    VStack(spacing: 5) {
      RoundedRectangle(cornerRadius: 14)
        .fill(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.75))
        .frame(width: 54, height: 54)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)

      if showLabel {
        Text(name)
          .font(.system(size: 10.5))
          .foregroundColor(.white)
          .lineLimit(1)
      }
    }
    .frame(maxWidth: .infinity)
  }
}

// ---------- Grille d'apps ----------
struct HomeGrid: View {
  let rows: [[String]] = [
    ["Calendar", "Photos", "Reminders", "News"],
    ["Maps", "Health", "Wallet", "Settings"]
  ]

  var body: some View {
    VStack(spacing: 16) {
      ForEach(0..<rows.count, id: \.self) { r in
        HStack(spacing: 0) {
          ForEach(0..<rows[r].count, id: \.self) { c in
            AppIcon(name: rows[r][c])
          }
        }
      }
    }
    .padding(.horizontal, 14)
  }
}

// ---------- Dock (4 emplacements, 2 apps au milieu) ----------
struct Dock: View {
  var body: some View {
    HTML("div", ["class": "liquid-glass", "style": "border-radius:32px;"]) {
      HStack(spacing: 0) {
        Color.clear.frame(maxWidth: .infinity)
        AppIcon(name: "Safari", showLabel: false)
        AppIcon(name: "Messages", showLabel: false)
        Color.clear.frame(maxWidth: .infinity)
      }
      .frame(height: 72)
    }
    .frame(height: 72)
    .padding(.horizontal, 10)
    .padding(.bottom, 26)
  }
}

// ---------- Home indicator ----------
struct HomeIndicator: View {
  var body: some View {
    Capsule()
      .fill(Color.white.opacity(0.9))
      .frame(width: 110, height: 5)
      .padding(.bottom, 8)
  }
}

// ---------- Écran d'accueil ----------
struct HomeScreen: View {
  var body: some View {
    ZStack {
      VStack {
        HomeGrid().padding(.top, 64)
        Spacer()
      }
      VStack {
        Spacer()
        Dock()
        HomeIndicator()
      }
    }
  }
}

// ---------- Montage dans l'iPhone HTML ----------
let root = JSObject.global.document.querySelector("#swift-root").object!
_ = DOMRenderer(HomeScreen(), root)
