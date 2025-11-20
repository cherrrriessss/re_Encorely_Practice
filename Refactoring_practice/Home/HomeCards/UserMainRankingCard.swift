//
//  UserRankingMainCard.swift
//  Refactoring_practice
//
//  Created by 이민서 on 11/16/25.
//

import SwiftUI
import Kingfisher

struct UserMainRankingCard: View {
    
    fileprivate enum UserMainRankingCardConstants {
        
        static let mainSpacing: CGFloat = 30
        static let textSpacing: CGFloat = 10
        
        static let backgroundSize: CGSize = .init(width: 153, height: 230)
        static let imageSize: CGSize = .init(width: 100, height: 100)
        
        static let rectangleRadius: CGFloat = 18
    }
    
    let userRanking: UserRanking
    
    var body: some View {
        Button(action: {
            //TODO: - 연결 추가
        }, label: {
            
            ZStack{
                RoundedRectangle(cornerRadius: UserMainRankingCardConstants.rectangleRadius)
                    .fill(Color.white)
                    .frame(width: UserMainRankingCardConstants.backgroundSize.width, height:  UserMainRankingCardConstants.backgroundSize.height)
                    .shadow(color: Color(red: 0.29, green: 0.29, blue: 0.29).opacity(0.3), radius: 4, x: 0, y: 2)
                
                
                VStack {
                    urlImage
                    Spacer() .frame(height: UserMainRankingCardConstants.mainSpacing)
                    performerInfo
                }
            }
            .padding(4)
        })
       // .buttonStyle(.glass)
    }
    
    //MARK: - 프로필 이미지
    @ViewBuilder
    private var urlImage : some View {
        if let url = URL(string: userRanking.imageUrl) {
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
                .frame(width: UserMainRankingCardConstants.imageSize.width, height: UserMainRankingCardConstants.imageSize.height)
                .clipShape(Circle())
        }
    }
   
    //MARK: - 닉네임 + 한 줄 소개
    private var performerInfo : some View {
        VStack {
            Text(userRanking.nickname)
                .font(.mainTextMedium16)
                .foregroundStyle(.grayColorA)
            
            Spacer() .frame(height: UserMainRankingCardConstants.textSpacing)
            
            Text(userRanking.instruction)
                .font(.mainTextMedium14)
                .foregroundStyle(.grayColorF)
        }
    }
}

#Preview {
    UserMainRankingCard(
        userRanking: UserRanking(
            id: 1,
            nickname: "회원 아이디",
            imageUrl: "https://www.hidomin.com/news/photo/202408/555650_315040_3204.jpg",
            instruction: "JPOP을 좋아하는 사람"
        )
    )
}
