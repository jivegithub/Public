class Entry

    # 初期化
    def initialize(url, info)
        @url = url
        @info = info
    end

    # T会員番号（16桁）でのエントリー
    def point_t16(driver)

        # 情報入力の繰り返し処理
        @info.each do |i|

            # エントリーサイトURLにアクセス
            driver.get @url

            # 口座番号
            driver.find_element(:id, 'fi_account_num').send_keys(i[:account])

            # 生年月日
            driver.find_element(:id, 'fi_birth_year').send_keys(i[:year])
            driver.find_element(:id, 'fi_birth_month').send_keys(i[:month])
            driver.find_element(:id, 'fi_birth_day').send_keys(i[:day])

            # ポイント種別（T-POINTを選択）
            driver.find_element(:xpath, "//div[@id='point_type_select']/label").click

            # 16桁のT会員番号
            driver.find_element(:id, 'fi_point_t16').send_keys(i[:point_t16])

            # メールアドレス
            driver.find_element(:id, 'fi_mail').send_keys(i[:mail])

            # 個人情報の取り扱いについて
            driver.find_element(:xpath, "//label[contains(.,'同意します')]").click

            # 次へ進む
            driver.find_element(:xpath, "//input[@value='次へ進む']").click

            # エントリー
            driver.find_element(:xpath, "//form[@id='point_program_confirm']/div/input[2]").click

            # 10秒待機
            sleep(10)

        end

    end

end
