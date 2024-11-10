import SwiftUI
import SwiftData

struct SingleTallyView: View {
    let size: Double
    @Bindable var tally: Tally
    @Environment(\.modelContext) var context
    var body: some View {
        Text("\(tally.value)")
            .font(.system(size: size, weight: .heavy, design: .rounded))
            .monospacedDigit()
            .contentTransition(.numericText())
            .minimumScaleFactor(0.5)
            .padding()
            .frame(width: size * 1.5, height: size * 1.5)
            .background(RoundedRectangle(cornerRadius: 20).fill(.clear).stroke(.primary, lineWidth: 5))
            .onTapGesture {
                withAnimation {
                    tally.increase()
                    try? context.save()
                }
            }
            .onTapGesture(count: 2) {
                withAnimation {
                    tally.decrease()
                    try? context.save()
                }
            }
    }
}

#Preview {
    @Previewable @State var tally = Tally(name: "Alpha")
    SingleTallyView(size: 100, tally: tally)
}