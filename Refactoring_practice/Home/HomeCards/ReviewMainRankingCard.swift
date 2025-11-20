//
//  ReviewMainRankingCard.swift
//  Refactoring_practice
//
//  Created by 이민서 on 11/16/25.
//

import SwiftUI
import Kingfisher

struct ReviewMainRankingCard: View {
    
    fileprivate enum ReviewMainRankingCardConstants {
        
        static let mainSpacing: CGFloat = 10
        static let textSpacing: CGFloat = 7
        
        static let backgroundImageSize: CGSize = .init(width: 190, height: 275)
        static let profileImageSize: CGSize = .init(width: 29, height: 29)
    }
    
    let reviewRanking: ReviewRanking
    
    var body: some View {
        Button(action: {
            //TODO: - 연결 추가
        }, label: {
            ZStack (alignment: .bottomLeading){
                backgroundUrlImage
                HStack {
                    profileUrlImage
                    userInfo
                }
                .padding()
            }
        })
        //.buttonStyle(.glass)
    }
    
    //MARK: - 배경 리뷰 이미지
    @ViewBuilder
    private var backgroundUrlImage : some View {
        if let url = URL(string: reviewRanking.reviewImageURL) {
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
                .frame(width: ReviewMainRankingCardConstants.backgroundImageSize.width, height: ReviewMainRankingCardConstants.backgroundImageSize.height)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    //MARK: - 프로필 이미지
    @ViewBuilder
    private var profileUrlImage : some View {
        if let url = URL(string: reviewRanking.userProfileImageURL) {
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
                .frame(width: ReviewMainRankingCardConstants.profileImageSize.width, height: ReviewMainRankingCardConstants.profileImageSize.height)
                .clipShape(Circle())
        }
    }
    
    //MARK: - 유저 닉네임
    private var userInfo : some View {
        VStack{
            Text(reviewRanking.nickname)
                .font(.mainTextMedium14)
                .foregroundStyle(.grayColorJ)
        }
    }
}


#Preview {
    ReviewMainRankingCard(
        reviewRanking: ReviewRanking(
            id: 1,
            reviewImageURL: "https://media.nudge-community.com/8795197",
            userProfileImageURL: "https://i.namu.wiki/i/Z4-6cZ8HHTzCw61vJDzRll8TxVPGFJyRLb8kvX_n7UjWIKeuH7cqwZlFCWnSLUP-9_Iz-K31vhIOgaVZEqavKg.webp",
            nickname: "kpop_lovers",
            comment: nil
        )
    )
}
