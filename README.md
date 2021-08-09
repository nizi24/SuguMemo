# タグメモ

![iphone12_keynote_tag_memoReadMeImage 005](https://user-images.githubusercontent.com/62362974/103216795-41843600-495a-11eb-98e6-39f504fddca1.jpeg)

## :sparkler: Overview

タグで分類できるメモ帳iOSアプリ

SwiftUIを使用して開発しています。

## :earth_americas: AppURL

[AppStore](https://apps.apple.com/us/app/%E3%82%BF%E3%82%B0%E3%83%A1%E3%83%A2/id1540566095?itsct=apps_box&itscg=30200)

## :computer: Features

- 検索する

![iphone12_keynote_tag_memoReadMeImage 006](https://user-images.githubusercontent.com/62362974/103216805-49dc7100-495a-11eb-8da3-043fe3dcfb8a.jpeg)

- タグで分類する

![iphone12_keynote_tag_memoReadMeImage 007](https://user-images.githubusercontent.com/62362974/103216810-4c3ecb00-495a-11eb-897a-e1883a1485e1.jpeg)

## :pencil2: Description

- メモを作成する
- メモにタグをつける
- メモを検索する
- メモをタグごとに分類して表示する
- 検索範囲を指定する

メモの保存にはRealmSwiftを使用しています。

## 使用技術・仕様の説明

※該当コードへのURLを載せているので是非ご覧ください。

#### 使用技術
| 名称 | 説明 |
| ---- | ---- |
| SwiftUI | UIフレームワーク |
| Realm Swift | データストア |

- Realmはメモを保存するのに使用しています。

#### 仕様・工夫した点

- メモを更新する時は自動保存
  - [該当コード](https://github.com/nizi24/TagMemo/blob/main/SuguMemo/ViewModel/EditMemoViewModel.swift#L13-L27)
- タイトルが設定されていない場合は、リスト表示したときに本文の冒頭が表示される
  - [該当コード](https://github.com/nizi24/TagMemo/blob/main/SuguMemo/ViewModel/MemoDisplayProcessor.swift#L14-L21)
- メモを検索する際は、タイトル、タグ、本文から部分一致で検索する
  - どれかのみを使用するように設定することもできる
  - [該当コード](https://github.com/nizi24/TagMemo/blob/main/SuguMemo/Model/SearchMemo.swift#L18-L32)
- タグごとにメモを分類するタグモード
  - メモ一覧のタグのマークを押すと切り替えられる
  - [該当コード(View)](https://github.com/nizi24/TagMemo/blob/main/SuguMemo/Views/MemoListTagModeView.swift)
  - [該当コード(ViewModel、タグごとにメモを分類)](https://github.com/nizi24/TagMemo/blob/main/SuguMemo/ViewModel/MemoListTagModeViewModel.swift#L22-L26)


## :computer: Version

- swift 5.3.1
- Xcode 12.2
- iOS 14.0

## 👀 Author

- [Twitter](https://twitter.com/nizi_24a)
- [Qiita](https://qiita.com/nizi24)
