//
//  MemoListView.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/07.
//

import SwiftUI
import GoogleMobileAds

struct MemoListView: View {
    @EnvironmentObject var viewModel: MemoListViewModel
    @State var tagMode = false
    
    var body: some View {
        NavigationView {
            VStack {
                if tagMode {
                    MemoListTagModeView(memoList: $viewModel.memoList)
                        .onAppear {
                            viewModel.memoList = []
                            viewModel.getAllInRealm(memodb: MemoDB())
                        }
                } else {
                    MemoList(memoList: $viewModel.memoList)
                        .onAppear {
                            viewModel.memoList = []
                            viewModel.getAllInRealm(memodb: MemoDB())
                        }
                }
                AdView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            .navigationBarTitle(Text("メモ一覧"), displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing:
                HStack {
                    Button(action: {
                        tagMode.toggle()
                    }, label: { Image(systemName: tagMode ? "tag.fill" : "tag") })
                    .padding()
                    NavigationLink(destination: SearchView()) {
                        Image(systemName: "magnifyingglass")
                    }
                }
            )
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView().environmentObject(MemoListViewModel())
    }
}
