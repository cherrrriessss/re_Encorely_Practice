//
//  HallCircleCard.swift
//  Refactoring_practice
//
import SwiftUI
import Kingfisher


struct HallCircleCard: View {
    
    fileprivate enum HallCircleCardConstants {
        
        static let mainSpacing: CGFloat = 10
        static let textSpacing: CGFloat = 7
        
        static let imageSize: CGSize = .init(width: 80, height: 82)
    }
    
    let hallCircleCardType: HallCircleCardType
    
    var body: some View {
        
        Button(action: {
            //TODO: - 연결 추가
        }, label: {
            VStack {
                urlImage
                Spacer() .frame(height: HallCircleCardConstants.mainSpacing)
                placeInfo
            }
        })
        //.buttonStyle(.glass)
    }
        
    
    @ViewBuilder
    private var urlImage : some View {
        if let url = URL(string: hallCircleCardType.imageURL) {
            KFImage(url)
                .placeholder({
                    ProgressView()
                        .controlSize(.mini)
                }).retry(maxCount: 2, interval: .seconds(2))
                .onFailure { error in
                    print("이미지 로드 실패: \(error)")
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: HallCircleCardConstants.imageSize.width, height: HallCircleCardConstants.imageSize.height)
                .clipShape(Circle())
        }
    }
        
    private var placeInfo : some View {
        VStack{
            Text(hallCircleCardType.name)
                .font(.mainTextMedium16)
                .foregroundStyle(.grayColorA)
            
            Spacer() .frame(height: HallCircleCardConstants.textSpacing)
            
            Label(hallCircleCardType.address, image: .location)
                .font(.mainTextMedium14)
                .foregroundStyle(.grayColorF)
        }
    }
}

#Preview {
    HallCircleCard(
        hallCircleCardType: HallCircleCardType(
                id : UUID(),
                name : "고척 스카이돔",
                address : "구로구",
                imageURL : "https://media.timeout.com/images/102941553/750/422/image.jpg"
            )
        )
}
