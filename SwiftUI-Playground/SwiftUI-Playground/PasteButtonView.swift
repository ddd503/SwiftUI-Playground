//
//  PasteButtonView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/08/26.
//

import SwiftUI

struct PasteButtonView: View {
    @State private var userPastedImageObj: UIImage?
    @State private var pastedText: String = ""
    @State private var imageLoadProgress: Progress?

    var body: some View {
        VStack(spacing: 20) {
            Text("ペーストボタン")
            HStack {
                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }
                Text(pastedText)
                Spacer()
            }
            PasteButton(supportedContentTypes: [.image], payloadAction: { providers in
                guard let firstProvider = providers.first else {
                    return
                }

                imageLoadProgress = firstProvider.loadDataRepresentation(for: .image) { data, error in
                    if let data, let imageObj = UIImage(data: data) {
                        // 基本グローバルスレッド（クロージャー内）ではUIは作らない
                        self.userPastedImageObj = imageObj
                    }
                }
            })
            .buttonBorderShape(.capsule)
            
            if let progress = imageLoadProgress {
                ProgressView(progress)
            }

            if let userPastedImageObj {
                Image(uiImage: userPastedImageObj)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
        }
        .padding(20)
    }
}

struct PasteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PasteButtonView()
    }
}
