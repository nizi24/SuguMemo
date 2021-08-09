//
//  MemoListTagModeViewModel.swift
//  SuguMemo
//
//  Created by Yuu Nishida on 2020/11/14.
//

import Foundation

struct MemoListTagModeViewModel: Identifiable {
    var id = UUID()
    var tagList: [String] = []
    var memoList: [Memo] = []
    var separateByTag: [String: [Memo]] = [String(): []]
    
    init(memoList: [Memo]) {
        self.memoList = memoList
        getTagList()
        separateMemoListByTag()
    }
    
    mutating func separateMemoListByTag() {
        for tag in tagList {
            separateByTag[tag] = memoList.filter { $0.tags.map { $0.name }.contains(tag) }
        }
    }
    
    mutating func getTagList() {
        tagList = memoList.reduce([], { tagList, memo in
            var tagsList = tagList
            tagsList.append(contentsOf: memo.tags.map { $0.name })
            return tagsList
        })
        tagList = tagList.reduce([], { $0.contains($1) ? $0 : $0 + [$1] })
    }    
}
