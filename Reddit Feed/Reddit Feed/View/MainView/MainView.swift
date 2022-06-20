//
//  MainView.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 6/16/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "list.dash")
                }
               
            ScannerView()
                .tabItem {
                    Label("Scanner", systemImage: "wifi")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
