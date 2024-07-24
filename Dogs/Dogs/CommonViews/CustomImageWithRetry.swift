//
//  CustomImageWithRetry.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import SwiftUI

struct CustomImageWithRetry: View {
    let url: URL?
    @State private var phase: AsyncImagePhase = .empty
    @State private var retryCount = 0
    private let maxRetryCount = 3
    var width : CGFloat = 100
    var height: CGFloat = 120
    
    var body: some View {
        Group {
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: width, maxHeight: height)
                    .task {
                        await loadImage()
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: width, maxHeight: height)
//                    .clipped()
            case .failure:
                if retryCount < maxRetryCount {
                    ProgressView()
                        .frame(maxWidth: width, maxHeight: height)
                        .task {
                            await retryLoadImage()
                        }
                } else {
                    Image(systemName: "PlaceHolderDog")
                        .resizable()
                        .frame(maxWidth: width, maxHeight: height)
                }
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private func loadImage() async {
        withAnimation {
            phase = .empty
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url!)
            if let uiImage = UIImage(data: data) {
                let image = Image(uiImage: uiImage)
                withAnimation {
                    phase = .success(image)
                }
            } else {
                withAnimation {
                    phase = .failure(URLError(.badServerResponse))
                }
            }
        } catch {
            withAnimation {
                phase = .failure(error)
            }
        }
    }
    
    private func retryLoadImage() async {
        retryCount += 1
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        await loadImage()
    }
}

#Preview {
    CustomImageWithRetry(url: URL(string: ""))
}
