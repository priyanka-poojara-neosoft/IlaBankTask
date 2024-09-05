//
//  ListView.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 31/08/24.
//

import SwiftUI

struct ListViewForCurrentIndex: View {

    let listData: [ServiceDetail]
    let currentIndex: Int

    var body: some View {
        if !listData.isEmpty {
            
            ForEach(listData, id: \.self) { service in
                ListView(serviceDetail: service)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
        } else {
            Text("No service details available")
                .padding()
        }
        
    }
}

struct ListView: View {
    
    var serviceDetail: ServiceDetail
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                let url = URL(string: serviceDetail.image ?? "")
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(width: 60, height: 60)
                    
                VStack(alignment: .leading) {
                    Text(serviceDetail.title ?? "")
                        .font(.headline)
                    Text(serviceDetail.subtitle ?? "")
                        .font(.subheadline)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
        }
        .background(Color.green.opacity(0.2))
        .cornerRadius(25)
    }
}

#Preview {
    ListView(serviceDetail: ServiceDetail(image: "https://cdn-icons-png.freepik.com/256/2721/2721217.png?ga=GA1.1.955653324.1724951161&semt=ais_hybrid", title: "Priyanka", subtitle: "Hii hahhek hifjksd jhajkh djkshajshf sfj  hsfhjd f  suhfdkj sjk jk aj jk sfh"))
}
