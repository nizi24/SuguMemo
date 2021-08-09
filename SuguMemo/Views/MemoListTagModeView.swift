//
//  MemoListViewTagMode.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/14.
//

import SwiftUI

struct MemoListTagModeView: View {
    @Binding var memoList: [Memo]
    @State var memos = [Memo]()
    @EnvironmentObject var memoListViewModel: MemoListViewModel

    var body: some View {
        let memoListSeparateByTag: [String: [Memo]] = MemoListTagModeViewModel(memoList: memoList).separateByTag
        let tagList: [String] = MemoListTagModeViewModel(memoList: memoList).tagList
        
        return List {
            ForEach(tagList.indices) { tagIndex in
                if tagList.count > tagIndex, let memos = memoListSeparateByTag[tagList[tagIndex]] {
                    Section(header: Text(tagList[tagIndex])) {
                        ForEach(0..<memos.count) { memoIndex in
                            let memo = memos[memoIndex]
                            NavigationLink(destination: EditMemoVIew(viewModel: EditMemoViewModel(id: memo.id, title: memo.title, context: memo.context, tags: memo.tags))) {
                                Text(MemoDisplayProcessor(memo: memo).title())
                            }
                        }.onDelete(perform: { indexSet in
                            memoListViewModel.deleteMemo(targetMemo: memos[indexSet.first!])
                        })
                    }
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct MemoListViewTagMode_Previews: PreviewProvider {
    static var previews: some View {
        MemoListTagModeView(memoList: .constant([]))
    }
}
