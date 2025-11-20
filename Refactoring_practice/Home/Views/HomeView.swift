//
//  HomeView.swift
//  Refactoring_practice
//
//  Created by 이민서 on 11/15/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Constants
    fileprivate enum HomeViewConstants {
        
        static let contentsSpacing: CGFloat = 30
        static let topBannerBottomSpacing: CGFloat = 20
        static let topBannerTextSpacing: CGFloat = 10
        static let topBannerTextBottomSpacing: CGFloat = 15
        static let textandCardSpacing: CGFloat = 20
        static let hallHSpacing: CGFloat = 30
        static let performanceHSpacing: CGFloat = 20
        static let userHSpacing: CGFloat = 20
        static let reviewHSpacing: CGFloat = 20
        
        static let iconSize: CGSize = .init(width: 25, height: 25)
        
        static let topBannerMainText: String = "단독 혜택부터 \n인기 공연 할인까지"
        static let topBannerSubText: String = "올 여름, 다양한 이벤트를 만나보세요"
        static let hallText: String = "자주 보는 공연장"
        static let performanceText: String = "현재 진행 중인 공연"
        static let userText: String = "인기 공연러"
        static let userSubText: String = "Encorely에서 인기가 많은 사용자들을 확인해보세요!"
        static let reviewText: String = "화제의 후기들"
        static let reviewSubText: String = "Encorely에서 화제의 후기들을 만나보세요!"
    }
    
    var body: some View {
        ScrollView{
            VStack{
                topBanner
                Spacer().frame(height:HomeViewConstants.topBannerBottomSpacing)
                VStack(spacing: HomeViewConstants.contentsSpacing) {
                    frequentVenueView
                    ongoingPerformancesView
                    bestPerformerView
                    bestReviewsView
                }
                .padding(.horizontal, DefaultConstants.defaultHorizon)
            }
        }
        .backgroundExtensionEffect()
        .contentMargins(.bottom, 110, for: .scrollContent)
    }
        
    
    //MARK: - 상단 배너
    private var topBanner: some View {
        ZStack(alignment: .bottomLeading) {
            Image(.homeBanner)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .backgroundExtensionEffect()
            
            VStack(alignment: .leading) {
                HStack {
                    Image(.ENCORELY)
                    Spacer()
                    Button(action: {}, label: {
                        Image(.magnifyingGlass)
                            .foregroundStyle(.grayColorJ)
                        })
                    .buttonStyle(.glass)
                    
                    Button(action: {}, label: {
                        Image(.alarm)
                            .foregroundStyle(.grayColorJ)
                        })
                    .buttonStyle(.glass)
                }
                Spacer()
                VStack (alignment: .leading, spacing: HomeViewConstants.topBannerTextSpacing) {
                    Text(HomeViewConstants.topBannerMainText)
                        .font(.mainTextSemiBold25)
                        .foregroundStyle(.grayColorJ)
                    Text(HomeViewConstants.topBannerSubText)
                        .font(.mainTextMedium16)
                        .foregroundStyle(.grayColorJ)
                    Spacer().frame(height:HomeViewConstants.topBannerTextBottomSpacing)
                }
            }
            .padding(.horizontal, DefaultConstants.defaultHorizon)
        }
    }
    
    private var frequentVenueView : some View {
        let venues = FrequentVenueMock
        
        return VStack {
            HStack {
                Text(HomeViewConstants.hallText)
                    .font(.mainTextSemiBold20)
                Spacer()
                
                Button (action: {}, label: {
                    Image(.chevronRight)
                        .frame(width: HomeViewConstants.iconSize.width, height: HomeViewConstants.iconSize.height)
                        .foregroundStyle(.black)
                })
            }
            Spacer().frame(height: HomeViewConstants.textandCardSpacing)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: HomeViewConstants.hallHSpacing) {
                    ForEach(venues) { venue in
                        HallCircleCard(hallCircleCardType: venue)
                    }
                }
            }
        }
    }
    
    private var ongoingPerformancesView : some View {
        let performances = OngoingShowMock
        
        return VStack {
            HStack {
                Text(HomeViewConstants.performanceText)
                    .font(.mainTextSemiBold20)
                Spacer()
                
                Button (action: {}, label: {
                    Image(.chevronRight)
                        .frame(width: HomeViewConstants.iconSize.width, height: HomeViewConstants.iconSize.height)
                        .foregroundStyle(.black)
                })
            }
            Spacer().frame(height: HomeViewConstants.textandCardSpacing)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: HomeViewConstants.performanceHSpacing) {
                    ForEach(performances) { performance in
                        ShowMainCard(ongoingShow: performance)
                    }
                }
            }
//            .contentMargins(.horizontal, 16, for: .scrollContent)
        }
    }
    
    private var bestPerformerView : some View {
        let performers = UserRankingMock
        
        return VStack (alignment: .leading) {
            HStack {
                Text(HomeViewConstants.userText)
                    .font(.mainTextSemiBold20)
                Spacer()
                
                Button (action: {}, label: {
                    Image(.chevronRight)
                        .frame(width: HomeViewConstants.iconSize.width, height: HomeViewConstants.iconSize.height)
                        .foregroundStyle(.black)
                })
            }
            Text(HomeViewConstants.userSubText)
                .font(.mainTextMedium14)
                .foregroundStyle(.black)
            Spacer().frame(height: HomeViewConstants.textandCardSpacing)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: HomeViewConstants.userHSpacing) {
                    ForEach(performers) { performer in
                        UserMainRankingCard(userRanking: performer)
                    }
                }
            }
        }
    }
    
    private var bestReviewsView : some View {
        let reviews = ReviewRankingMock
        
        return VStack (alignment: .leading) {
            HStack {
                Text(HomeViewConstants.reviewText)
                    .font(.mainTextSemiBold20)
                Spacer()
                
                Button (action: {}, label: {
                    Image(.chevronRight)
                        .frame(width: HomeViewConstants.iconSize.width, height: HomeViewConstants.iconSize.height)
                        .foregroundStyle(.black)
                })
            }
            Text(HomeViewConstants.reviewSubText)
                .font(.mainTextMedium14)
                .foregroundStyle(.black)
            Spacer().frame(height: HomeViewConstants.textandCardSpacing)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: HomeViewConstants.reviewHSpacing) {
                    ForEach(reviews) { review in
                        ReviewMainRankingCard(reviewRanking: review)
                    }
                }
            }
        }
    }
}



#Preview {
    HomeView()
}
