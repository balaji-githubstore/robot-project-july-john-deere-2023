from selenium import webdriver

opt=webdriver.ChromeOptions()
opt.add_experimental_option("debuggerAddress","127.0.0.1:9223")
driver=webdriver.Chrome(chrome_options=opt)
print(driver.title)
driver.quit()
