//
//  NewTallyView.swift
//  MyTallies
//
//  Created by Ml bench-iOS Dev on 1/20/26.
//



import SwiftUI
import SwiftData

struct NewTallyView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Query var tallies: [Tally]
    @Binding var selectedTally: Tally?
    @State private var name: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TextField("name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    let newTally = Tally(name: name)
                    context.insert(newTally)
                    try? context.save()
                    selectedTally = newTally
                    dismiss()
                }
                .buttonStyle(.bordered)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(name.isEmpty || tallies.map{$0.name}.contains(name))
                Spacer()
            }
            .padding()
            .navigationTitle("New Tally")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
    }
}

#Preview {
    NewTallyView(selectedTally: .constant(nil))
}