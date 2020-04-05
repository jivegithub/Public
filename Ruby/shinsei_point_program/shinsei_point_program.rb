require 'selenium-webdriver' # Seleniumの読み込み
require_relative 'lib/entry' # entry.rbの読み込み

# 新生ポイントプログラム エントリーサイトURL
url = 'https://webform.shinseibank.com/webapp/form/19913_xldb_4/index.do?lid=p'

# 入力情報
## name       任意の名前
## account    新生銀行の口座番号10桁の数字(店番+口座番号)
## year       誕生日（年） ※西暦4桁
## month      誕生日（月）※0埋め無し
## day        誕生日（日）  ※0埋め無し
## point_t16  16桁のT会員番号
## mail       メールアドレス
## 設定例     info = [{name:'jive_orz', account:'4001234567', year:'1987', month:'1', day:'23', point_t16:'1234567890123456', mail:'sample@jive_orz.com'},
info = [{name:'任意の名前', account:'口座番号', year:'誕生日(年)', month:'誕生日(月)', day:'誕生日(日)', point_t16:'16桁のT会員番号', mail:'メールアドレス'}]

# ブラウザ起動
driver = Selenium::WebDriver.for :chrome

# Entryクラス初期化
entry = Entry.new(url, info)

# Entryクラスのpoiint_t16メソッド実行
entry.point_t16(driver)

# ブラウザ終了
driver.quit
