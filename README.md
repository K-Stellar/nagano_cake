# ながのCAKE
<img width="640" alt="naganocake" src="https://user-images.githubusercontent.com/121223610/221133606-b115bf97-e235-4b12-9491-da8492b6452c.png">

### トップページ

<img width="1323" alt="naganocake-top" src="https://user-images.githubusercontent.com/121223610/221133260-04e3187b-5427-4c2c-8552-9fedf5f0c844.png">


## 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を全国を対象に通販するためのECサイトです。<br>
(DMM WEBCAMP チーム開発フェーズの課題として作成しています。)

## 簡単な説明
+ サイトは顧客側(customer)と管理者側(admin)に分かれています。
+ 管理者側は、設定したメールアドレスとパスワードでログインすると、商品や顧客の編集を行うことができます。
+ 顧客側は、商品ページの閲覧はログイン不要ですが、それ以外のページはログインが必要です。

+ 各商品、1日の受注量に制限は設けていません。
+ 送料は1配送につき全国一律800円、消費税率は10%で統一しています。

## アプリケーション機能一覧
顧客が操作する「会員側機能」と店側が操作する「管理者側機能」があります。

### 【会員側機能】

**ログイン機能：**
+ 顧客は新規会員登録、ログイン・ログアウト、退会することができます。
+ ログインにはメールアドレスとパスワードの入力が必要です。
+ 会員がログインしている場合、ヘッダーに会員名(姓)が表示されます。
+ ログイン後、マイページから会員情報の編集画面、配送先一覧画面、購入履歴一覧画面へ遷移できます。
+ サイトの閲覧はログイン不要ですが、商品購入を含むその他の機能にはログインが必要です。
+ 退会すると、履歴の確認も不可になります。

**カート機能：**
+ 販売商品が一覧表示され、商品をクリックするとその商品の詳細ページに遷移します。
+ ログインしている場合のみ、商品詳細ページからカートに商品を追加することができます。
+ カート一覧画面では、商品の個数変更、削除、カート内商品の全削除ができます。

**注文機能：**
+ 注文詳細画面にて、支払方法と配送先の指定ができます。
+ クレジットカード情報はシステム上保持しません。
+ 配送先は配送先一覧画面からも新規登録、編集、削除ができます。
+ 購入後は注文履歴一覧画面から注文詳細を確認することができます。

**検索機能：**
+ ヘッダーの検索フォームから商品検索ができます。
+ トップ画面、商品画面からジャンルごとの商品検索ができます。

### 【管理者側機能】

**ログイン機能：**
+ メールアドレスとパスワードでログインができます。<br>
　"メールアドレス：admin@admin"<br>
　"パスワード：naganocake"
+ ログインしないと他のページに遷移できません。

**注文管理機能：**
+ Topページでは過去の注文履歴一覧画面が表示されます。
+ 注文履歴の購入日時をクリックすると注文詳細を確認することができます。
+ 注文詳細画面では、注文ステータスと制作ステータスの変更ができます。<br>
　注文ステータス：入金待ち/入金確認/製作中/発送準備中/発送済み<br>
　製作ステータス：着手不可/製作待ち/製作中/製作完了

**会員管理機能：**
+ 会員一覧画面で会員氏名をクリックすると会員情報を確認できます。
+ 会員情報画面から、会員情報の編集、会員の注文履歴一覧の確認ができます。
+ 会員情報編集画面では、会員ステータスの変更ができます。<br>
　会員ステータス：会員/退会

**商品管理機能：**
+ 商品一覧画面から商品名をクリックすると商品詳細画面が表示されます。
+ 商品詳細画面から、商品の情報と販売ステータスの変更ができます。<br>
　販売ステータス：販売中/販売停止中
+ ジャンル一覧から登録済みのジャンル確認と、ジャンルの新規追加ができます。

**検索機能：**
+ ヘッダーの検索フォームから検索ができます。
+ 検索の際には、プルダウンにて商品検索か会員検索か選択できます。

## 設計書
+ [ER図](https://user-images.githubusercontent.com/121223610/221136073-249fef26-e03a-41ed-bef5-92c610d16549.png)
+ [テーブル定義書](https://github.com/K-Stellar/nagano_cake/files/10822001/default.pdf)
+ [アプリケーション詳細設計書](https://github.com/K-Stellar/nagano_cake/files/10821973/default.pdf)


### 開発環境
+ Ruby 3.1.2
+ Ruby on Rails 6.1.7.2

### 使用したGemと機能
+ devise
+ devise-i18n
+ kaminari
+ enum_help
+ bootstrap
+ FontAwesome (yarn)

## 作成者
**Team Stellar**<br>
　りょーま<br>
　さとし<br>
　つーじー<br>
　ほぐ
